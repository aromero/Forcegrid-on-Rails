class XhrController < ApplicationController
  def skills
    @skills = Skill.find_all_by_category_id(params[:id])
    render :xml => @skills.to_xml
  end

  def subcategories
    @subcategories = Category.find(params[:id]).subcategories
    render :xml => @subcategories.to_xml
  end

end
