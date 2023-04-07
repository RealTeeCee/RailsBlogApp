class LikesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        Like.create(likeable_id: params["likeable_id"], likeable_type: 'Post')
        redirect_to post_url(params["likeable_id"])
    end

    def destroy
        like = Like.where(likeable_id: params["likeable_id"], likeable_type: 'Post').first
        if like
            like.destroy 
        end
        redirect_to post_url(params["likeable_id"])
    end
end
