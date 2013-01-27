class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end
  
  def update
    authorize! :update, @reports, :message => 'Not authorized as an administrator.'
    @reports = Report.find(params[:id])
    if @reports.update_attributes(params[:report], :as => :admin)
      redirect_to reports_path, :notice => "User updated."
    else
      redirect_to reports_path, :alert => "Unable to update report."
    end
  end
    
  def destroy
    authorize! :destroy, @report, :message => 'Not authorized as an administrator.'
    report = Report.find(params[:id])
    report.destroy
    redirect_to reports_path, :notice => "report deleted."
  end
end
