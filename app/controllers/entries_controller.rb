class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.xml
  def index
    @entries = Entry.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @entries.to_xml }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @entry.to_xml }
    end
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1;edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        flash[:notice] = 'Entry was successfully created.'
        format.html { redirect_to entry_url(@entry) }
        format.xml  { head :created, :location => entry_url(@entry) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors.to_xml }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        flash[:notice] = 'Entry was successfully updated.'
        format.html { redirect_to entry_url(@entry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors.to_xml }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.xml  { head :ok }
    end
  end
end
