class SongsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        songs = Song.all
        render json: songs, include: ['id', 'name', 'youtube_link']
      end

      def show
        song = find_song
        render json: song 

        # if song
        #   render json: song
        # else 
        #   render json: {error: "song not found"}
        # end
      end


      def top_charts
        top_song = Song.most_popular
        render json: top_song.top_songs
      end 


private
            
        def find_song
            # Song.find(params[:id])
            Song.find_by(id: params[:id])
        end

         def render_not_found_response
            render json: { error: "Song not found" }, status: :not_found
        end
         
end
