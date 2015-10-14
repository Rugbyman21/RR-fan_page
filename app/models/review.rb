class Review < ActiveRecord::Base
  belongs_to :artist
  validates :author, :content, presence: true
end
