class EffectivenessesController < ApplicationController
  # GET /effectivenesses
  # GET /effectivenesses.xml
  def index
    @effectivenesses = Effectiveness.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @effectivenesses }
    end
  end

  # GET /effectivenesses/1
  # GET /effectivenesses/1.xml
  def show
    @effectiveness = Effectiveness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @effectiveness }
    end
  end

  # GET /effectivenesses/new
  # GET /effectivenesses/new.xml
  def new
    @effectiveness = Effectiveness.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @effectiveness }
    end
  end

  # GET /effectivenesses/1/edit
  def edit
    @effectiveness = Effectiveness.find(params[:id])
  end

  # POST /effectivenesses
  # POST /effectivenesses.xml
  def create
    @effectiveness = Effectiveness.new(params[:effectiveness])

    respond_to do |format|
      if @effectiveness.save
        flash[:notice] = 'Effectiveness was successfully created.'
        format.html { redirect_to(@effectiveness) }
        format.xml  { render :xml => @effectiveness, :status => :created, :location => @effectiveness }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @effectiveness.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /effectivenesses/1
  # PUT /effectivenesses/1.xml
  def update
    @effectiveness = Effectiveness.find(params[:id])

    respond_to do |format|
      if @effectiveness.update_attributes(params[:effectiveness])
        flash[:notice] = 'Effectiveness was successfully updated.'
        format.html { redirect_to(@effectiveness) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @effectiveness.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /effectivenesses/1
  # DELETE /effectivenesses/1.xml
  def destroy
    @effectiveness = Effectiveness.find(params[:id])
    @effectiveness.destroy

    respond_to do |format|
      format.html { redirect_to(effectivenesses_url) }
      format.xml  { head :ok }
    end
  end
end
