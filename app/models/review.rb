class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  before_save(:titleize_review)

  private
    def titleize_review
      self.author = self.author.titleize
    end
end