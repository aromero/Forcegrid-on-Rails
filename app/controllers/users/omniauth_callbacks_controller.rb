class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def method_missing(method, *args)
      raise "Unknown Provider Method: #{method}" unless method.to_s.downcase =~ /(google|facebook)/

      omniauth = request.env['omniauth.auth']
      @user = User.includes(:authentications).merge(Authentication.where(:provider => omniauth['provider'], :uid => omniauth['uid'])).first

      if @user
        sign_in_and_redirect(:user, @user)

      elsif current_user
        current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
        redirect_to(redirect_location(:user, @user))
      else
        @user = User.new
        @user.password = Devise.friendly_token[0,20]
        @user.email = omniauth['user_info']['email']
        @user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
        @user.save!
        
        sign_in_and_redirect(:user, @user)
      end
    end  

end