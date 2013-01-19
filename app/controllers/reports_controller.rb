class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
