class HomeController < ApplicationController
  
  def index
    if current_user
      @users = User.all
      @reports = Report.all
      render :dashboard
    end
  end

  def dashboard
     @users = User.all
  end
  
end
