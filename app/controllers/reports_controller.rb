class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end
    
  def destroy
    authorize! :destroy, @report, :message => 'Not authorized as an administrator.'
    report = Report.find(params[:id])
    report.destroy
    redirect_to reports_path, :notice => "report deleted."
  end
end
