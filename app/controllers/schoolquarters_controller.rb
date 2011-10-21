class SchoolquartersController < ApplicationController
  # GET /schoolquarters
  # GET /schoolquarters.xml
  def index
    @schoolquarters = Schoolquarter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schoolquarters }
    end
  end

  # GET /schoolquarters/1
  # GET /schoolquarters/1.xml
  def show
    @schoolquarter = Schoolquarter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @schoolquarter }
    end
  end

  # GET /schoolquarters/new
  # GET /schoolquarters/new.xml
  def new
    @schoolquarter = Schoolquarter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @schoolquarter }
    end
  end

  # GET /schoolquarters/1/edit
  def edit
    @schoolquarter = Schoolquarter.find(params[:id])
  end

  # POST /schoolquarters
  # POST /schoolquarters.xml
  def create
    @schoolquarter = Schoolquarter.new(params[:schoolquarter])

    respond_to do |format|
      if @schoolquarter.save
        flash[:notice] = 'Schoolquarter was successfully created.'
        format.html { redirect_to(@schoolquarter) }
        format.xml  { render :xml => @schoolquarter, :status => :created, :location => @schoolquarter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @schoolquarter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schoolquarters/1
  # PUT /schoolquarters/1.xml
  def update
    @schoolquarter = Schoolquarter.find(params[:id])

    respond_to do |format|
      if @schoolquarter.update_attributes(params[:schoolquarter])
        flash[:notice] = 'Schoolquarter was successfully updated.'
        format.html { redirect_to(@schoolquarter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @schoolquarter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schoolquarters/1
  # DELETE /schoolquarters/1.xml
  def destroy
    @schoolquarter = Schoolquarter.find(params[:id])
    @schoolquarter.destroy

    respond_to do |format|
      format.html { redirect_to(schoolquarters_url) }
      format.xml  { head :ok }
    end
  end
end
