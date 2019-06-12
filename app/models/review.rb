class Review < ActiveRecord::Base

    validates :product_id, presence: true
    validates :user_id, presence: true
    validates :rating, presence: true
    validates_numericality_of :rating, :greater_than_or_equal_to => 0.0, :less_than_or_equal_to => 5.0

end
