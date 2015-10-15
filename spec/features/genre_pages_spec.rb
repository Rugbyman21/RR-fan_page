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

describe "delete genre process" do
  it "will delete a genre" do
    genre = Genre.create({name: "Rock"})
    visit genre_path(genre)
    click_on "Delete"
    expect(page).to have_no_content "Rock"
  end
end

describe "update genre process" do
  it "will update a genre" do
    genre = Genre.create({name: "Rock"})
    visit genre_path(genre)
    click_on "Update"
    fill_in "Name", with: "Rock and Roll"
    click_on "Update Genre"
    expect(page).to have_content "Rock and Roll"
  end
end
