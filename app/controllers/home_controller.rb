class HomeController < ApplicationController
  layout :home_layout

  def index
    @users = User.all
    @user = current_user || User.new
  end

  private
    def home_layout
      user_signed_in? ? "application" : "splash"
    end
end
