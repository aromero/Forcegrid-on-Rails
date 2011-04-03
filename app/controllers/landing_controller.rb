class LandingController < ApplicationController
  def show
    @sub_categories = Category.where(:category_id != nil)
  end
end