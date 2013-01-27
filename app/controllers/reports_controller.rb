class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end
  
  def edit
    @report = Report.find(params[:id])
  end
  
  def update
    @report = Report.find(params[:id])
 
    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html  { redirect_to(@report,
                      :notice => 'Report was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @report.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
    
  def destroy
    authorize! :destroy, @report, :message => 'Not authorized as an administrator.'
    report = Report.find(params[:id])
    report.destroy
    redirect_to reports_path, :notice => "report deleted."
  end
end
