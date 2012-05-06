class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.xml
  def index
    @discussions = Discussion.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @discussions.to_xml }
    end
  end

  # GET /discussions/1
  # GET /discussions/1.xml
  def show
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @discussion.to_xml }
    end
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1;edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.xml
  def create
    @discussion = Discussion.new(params[:discussion])

    respond_to do |format|
      if @discussion.save
        flash[:notice] = 'Discussion was successfully created.'
        format.html { redirect_to discussion_url(@discussion) }
        format.xml  { head :created, :location => discussion_url(@discussion) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @discussion.errors.to_xml }
      end
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.xml
  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        flash[:notice] = 'Discussion was successfully updated.'
        format.html { redirect_to discussion_url(@discussion) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @discussion.errors.to_xml }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.xml
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.xml  { head :ok }
    end
  end
end
