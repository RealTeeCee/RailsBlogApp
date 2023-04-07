class LikesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def update
        Like.create(likeable_id: params["likeable_id"], likeable_type: 'Post')
        redirect_to post_url(params["likeable_id"])
    end

    def remove
        like = Like.where(likeable_id: params["likeable_id"], likeable_type: 'Post').first
        if like
            like.destroy 
        end
        redirect_to post_url(params["likeable_id"])
    end
end
