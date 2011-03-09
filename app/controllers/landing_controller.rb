class LandingController < ApplicationController
  def index
    @sub_categories = Category.where(:category_id != nil)
  end
end