# coding: utf-8

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def method_missing(method, *args)
    raise "Unknown Provider Method: #{method}" unless method.to_s.downcase =~ /(google|facebook)/

    omniauth = request.env['omniauth.auth']
    #@user = User.includes(:authentications).merge(Authentication.where(:provider => omniauth['provider'], :uid => omniauth['uid'])).first
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    # Si hay jobs para postear
    session[:job].save if session[:job]
  
    if authentication
      sign_in_and_redirect(:user, authentication.user)

    elsif current_user
      current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
      redirect_to(redirect_location(:user, user))
    else
      new_user = User.find_by_email(omniauth['user_info']['email']) || User.new
      new_user.apply_omniauth(omniauth)
      new_user.save!
      flash[:notice] = 'Thank you for posting your job. You\'ll hear from us soon'
      sign_in_and_redirect(:user, new_user)
    end
  end 
end