require 'rails_helper'

describe "add a member path" do
  it "add a member to a artist" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id})
    visit artist_path(artist)
    click_on "Add New Member"
    fill_in 'First name', with: "Dave"
    fill_in 'Last name', with: "Grule"
    fill_in 'Instrument', with: "Drums"
    fill_in 'Age', with: 46
    fill_in 'Time in band', with: 20
    click_on "Create Member"
    expect(page).to have_content "Dave"
  end

  it "gives an error if any of the lines are blank" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id})
    visit new_artist_member_path(artist)
    click_on "Create Member"
    expect(page).to have_content "There was an error. Please try again"
  end
end

describe "delete member path" do
  it "will delete a member" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id})
    member = Member.create({first_name: "Dave", last_name: "Grohl", instrument: "Drums", age: 46, time_in_band: 10, artist_id: artist.id})
    visit artist_member_path(artist, member)
    click_on "Delete Dave Grohl"
    expect(page).to have_no_content "Dave Grohl"
  end
end

describe "update member path" do
  it "will update a member" do
    genre = Genre.create(name: "Rock")
    artist = Artist.create({name: "Foo Fighter", genre_id: genre.id})
    member = Member.create({first_name: "Dave", last_name: "Grohl", instrument: "Drums", age: 46, time_in_band: 10, artist_id: artist.id})
    visit artist_member_path(artist, member)
    click_on "Update Dave Grohl"
    fill_in 'First name', with: "Davis"
    fill_in 'Last name', with: "Grohl"
    fill_in 'Instrument', with: "Bass"
    fill_in 'Age', with: 46
    fill_in 'Time in band', with: 20
    click_on "Update Member"
    expect(page).to have_content "Davis Grohl"
  end
end
