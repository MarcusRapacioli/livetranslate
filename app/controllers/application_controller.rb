class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
  # heroku config:set HOST=www.my_product.com

  def after_sign_in_path_for(user)
    user_path(user)
  end

  def after_sign_up_path_for(user)
    user_path(user)
  end
end
