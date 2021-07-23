class Song < ApplicationRecord
    has_many :reviews
    has_many :super_fans, through: :reviews

    # has_many :super_fans # google aliasing active record relationships [BONUS]
    has_many :my_fans, class_name: "SuperFan"

    def self.most_popular
        self.all.max_by{|song| song.reviews.count}
    end 

    def top_songs
        id: self.id,
        name: self.name,
        total_reviews: self.reviews.count,
        average_rating: self.reviews.average(:rating)
    end 


end
