class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :members
  has_many :reviews
  validates :name, presence: true
end
