require 'rails_helper'

describe Member do
  it {should validate_presence_of :first_name}
  it {should validate_presence_of :last_name}
  it {should validate_presence_of :instrument}
  it {should validate_presence_of :age}
  it {should validate_presence_of :time_in_band}
  it {should belong_to :artist}
end
