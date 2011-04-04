# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def remote_jquery_ui(version)
    if Rails.env == 'development'
      "'jqueryui', '#{version}', {uncompressed:true}"
    else
      "'jqueryui', '#{version}'"
    end
  end

  def local_jquery_ui(version)
    if Rails.env == 'development'
      "#{version}/jquery-ui.js"
    else
      "#{version}/jquery-ui.min.js"
    end
  end
end
