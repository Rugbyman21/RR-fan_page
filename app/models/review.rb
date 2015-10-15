class Review < ActiveRecord::Base
  belongs_to :artist
  validates :author, :content, presence: true

  default_scope {
    order('created_at DESC')
  }
end
