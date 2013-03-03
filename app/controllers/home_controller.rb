class HomeController < ApplicationController
  
  def index
    if current_user
      @users = User.all
      @reports = Report.all
      @companies = Company.all
      render :dashboard
    end
  end

  def dashboard
  end
  
end
