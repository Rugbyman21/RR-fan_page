class Genre < ActiveRecord::Base
  has_many :artists
  validates :name, presence: true

  default_scope {
    order('name DESC')
  }
end
