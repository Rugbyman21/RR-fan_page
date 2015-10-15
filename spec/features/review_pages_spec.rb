require 'rails_helper'

describe "new review path" do
  it "will create a new review" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id})
    visit artist_path(artist)
    click_on "Add New Review"
    fill_in "Author", with: "Justin"
    fill_in "Content", with: "Stuff"
    click_on "Create Review"
    expect(page).to have_content "Justin"
  end

  it "will display errors if not saved" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id})
    visit new_artist_review_path(artist)
    click_on "Create Review"
    expect(page).to have_content "error"
  end
end

describe "delete function for review" do
  it "will delete review" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id})
    review = Review.create(author: "Justin", content:"Stuff", artist_id: artist.id)
    visit artist_path(artist)
    click_on "Delete"
    expect(page).to have_no_content "Justin"
  end
end
