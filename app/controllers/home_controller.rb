class HomeController < ApplicationController
  def index
    @users = User.all
    @reports = Report.all
  end
end
