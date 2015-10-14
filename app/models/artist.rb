class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :members
  validates :name, presence: true
end
