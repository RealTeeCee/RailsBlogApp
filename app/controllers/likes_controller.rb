class LikesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def update
        Like.create(likeable_id: params["likeable_id"], likeable_type: 'Post')
        redirect_to post_url(params["likeable_id"])
    end
end
