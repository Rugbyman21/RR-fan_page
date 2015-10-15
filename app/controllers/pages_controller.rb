class PagesController < ApplicationController
  def index
    render template: "home"
  end
end
