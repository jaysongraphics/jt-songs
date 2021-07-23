class Song < ApplicationRecord
    has_many :reviews
    has_many :super_fans, through: :reviews
    # has_many :super_fans # google aliasing active record relationships [BONUS]



    def self.top_charts
        self.all.max_by{|song| song.reviews.count}
        # Song.all.max_by{|song| song.reviews.count}

    end 


end
