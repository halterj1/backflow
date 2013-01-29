class ReportsController < ApplicationController
  load_and_authorize_resource
  
  def index
    if params[:tag]
      @reports = Report.tagged_with(params[:tag])
    else
      @reports = Report.all
    end
  end

  def show
    @report = Report.find(params[:id])
    @commentable = @report
    @reports = @commentable.comments
    @comment = Comment.new
  end
  
  def new
    @report = Report.new
 
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @report }
    end
  end
  
  def create
    @report = Report.new(params[:report])
 
    respond_to do |format|
      if @report.save
        format.html  { redirect_to(@report,
                      :notice => 'Report was successfully created.') }
        format.json  { render :json => @report,
                      :status => :created, :location => @report }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @report.errors,
                      :status => :unprocessable_entity }
      end
    end
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
    report = Report.find(params[:id])
    report.destroy
    redirect_to reports_path, :notice => "report deleted."
  end
end
