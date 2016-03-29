class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    #request.env["omniauth.auth"] are data received from Facebook
#    byebug
    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts "-----------try to puts request.env---------------------"
    q=request.env["omniauth.auth"]
#    puts q
    puts q.credentials["expires_at"]
    puts q.info["image"]
    puts "-----------try to puts request.env---------------------"    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      #:event => :authentication will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end