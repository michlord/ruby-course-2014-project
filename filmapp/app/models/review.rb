class Review < ActiveRecord::Base

  belongs_to :movie
  belongs_to :user
  
  def self.random_review
    rand_id = rand Review.count
    Review.where("id >= ?", rand_id).first
  end
  
  validates :headline, presence: true
  validates :content, presence: true
  
end
