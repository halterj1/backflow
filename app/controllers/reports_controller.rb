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
    report = report.find(params[:id])
    unless report == current_report
      report.destroy
      redirect_to reports_path, :notice => "report deleted."
    else
      redirect_to reports_path, :notice => "Can't delete yourself."
    end
  end
end
