require 'rails_helper'

describe 'the add genre process' do
  it 'add a new genre' do
    visit genres_path
    click_on "New Genre"
    fill_in "Name", with: "Rock"
    click_on "Create Genre"
    expect(page).to have_content "Rock"
  end

  it 'will give errors if genre isnt saved' do
    visit new_genre_path
    click_on "Create Genre"
    expect(page).to have_content 'error'
  end
end
