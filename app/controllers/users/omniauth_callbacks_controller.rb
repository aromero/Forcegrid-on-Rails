# coding: utf-8

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def method_missing(method, *args)
    raise "Unknown Provider Method: #{method}" unless method.to_s.downcase =~ /(google|facebook)/

    omniauth = request.env['omniauth.auth']
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    
    if authentication
      user = authentication.user
      sign_in :user, authentication.user
    elsif current_user
      current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
      redirect_to(redirect_location(:user, user))
    else
      user = User.find_by_email(omniauth['user_info']['email']) || User.new
      user.apply_omniauth(omniauth)
      user.save!
      sign_in :user, user
    end
        
    if session[:employer]
      if session[:employer].save
        user.owner = session[:employer]
        user.save!
        redirect_to session[:employer], :notice => 'You have signed up succesfully'
      else
        redirect_to new_job_path(session[:job])
      end
    else
      redirect_to request.env['omniauth.origin']
    end
  end 
end