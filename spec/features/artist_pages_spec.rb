require 'rails_helper'

describe "add a artist process" do
  it "adds a new artist" do
    genre = Genre.create({name: "Rock"})
    visit genre_path(genre)
    click_on "New Artist"
    fill_in "Name", with: "Foo Fighter"
    click_on "Create Artist"
    expect(page).to have_content "Foo Fighter"
  end

  it "gives error when no name is entered" do
    genre = Genre.create({name: "Rock"})
    visit new_genre_artist_path(genre)
    click_on "Create Artist"
    expect(page).to have_content "There was an error. Please try again:"
  end
end

describe "edit a artist process" do
  it "edit a artist" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id} )
    visit artist_path(artist)
    click_on "Update Foo Fighter"
    fill_in "Name", with: "Foo Fighters"
    click_on "Update Artist"
    expect(page).to have_content "Foo Fighters"
  end
end

describe "delete artist process" do
  it "delete artist" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id})
    visit artist_path(artist)
    click_on "Delete Foo Fighter"
    expect(page).to have_no_content "Foo Fighter"
  end
end
