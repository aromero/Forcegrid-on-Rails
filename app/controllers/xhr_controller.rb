class XhrController < ApplicationController
  def skills
    @skills = Skill.all.where(['LOWER(name) LIKE LOWER(?)',"#{params[:name]}%"]).map {|s| [s.id, s.name]}
    render :json => @skills
  end
end
