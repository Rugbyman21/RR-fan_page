require 'rails_helper'

describe Artist do
  it { should validate_presence_of :name}
  it {should belong_to :genre}
  it {should have_many :members}
end
