class Member < ActiveRecord::Base
  belongs_to :artist
  validates :first_name, :last_name, :instrument, :age, :time_in_band, presence: true

  default_scope {
    order('first_name ASC')
  }
end
