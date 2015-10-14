require 'rails_helper'

describe Genre do
  it {should validate_presence_of :name}
  it {should have_many :artists}
end
