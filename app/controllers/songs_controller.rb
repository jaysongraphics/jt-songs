class SongsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        songs = Song.all
        render json: songs, include: ['id', 'name', 'youtube_link']
      end

      def show
        song = find_song
        render json: song 
      end


      def top_charts
        byebug
        tops = Song.top_charts
        render json: tops
      end 


private
            
        def find_song
            Song.find(params[:id])
        end

         def render_not_found_response
            render json: { error: "Song not found" }, status: :not_found
        end
         


end
