class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :could_not_be_created


    def create
        # byebug
        review = Review.create!(song_id: params[:song_id], super_fan_id: params[:super_fan_id], rating: params[:rating], comment: params[:comment])
        render json: review.song, include: ['id', 'name', 'youtube_link']
    end 




    private

    def could_not_be_created
        render json: { error: "validation errors" }, status: :unprocessable_entity
    end

  
end
