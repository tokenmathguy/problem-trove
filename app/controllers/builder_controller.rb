class BuilderController < ApplicationController
  before_filter :login_required
  attr_reader :draft, :searchresults

  def index
    @draft = find_draft
    @searchresults = Question.search(params[:search])
  end

  def set_title
    t = params[:title]
    if t
      @draft = find_draft
      @draft.title = t

      respond_to do |format|
        format.js
      end
    else
      flash[:notice] = "cannot set title of draft"
      redirect_to :action => :index
    end
  end

  def remove_question
    q = Question.find_by_id(params[:id])
    if q
      @draft = find_draft
      @draft.remove_question(q)
    else
      flash[:notice] = "cannot remove question from draft"
      #redirect_to :action => :index
    end
    redirect_to :action => :index
  end

  def add_question
    q = Question.find_by_id(params[:id])
    if q
      @draft = find_draft
      @draft.add_question(q)
    else
      flash[:notice] = "cannot add question to draft"
      #redirect_to :action => :index
    end
    redirect_to :action => :index
  end

  def finalize
    @draft = find_draft
    @offerings = Offering.all
    if @draft.questions.empty?
      flash[:notice] = "your draft is empty"
      redirect_to :action => :index 
    end
  end

  def save_draft
    @draft = find_draft
    @offerings = Offering.all
    if @draft.questions.empty?
      flash[:notice] = "your draft is empty"
      redirect_to :action => :index 
    else
      @lab = Lab.new(params[:lab])
      @lab.user = current_user
      @lab.add_questions_from_draft(@draft)
      @lab.offering = Offering.find_by_id(params[:offering][:id])
      if (@lab.save!)
        session[:draft] = nil
        redirect_to :controller => :labs, :action => :index
      else
        render :action => :finalize
      end
    end
  end

  def clear_draft
    session[:draft] = nil
    redirect_to :action => :index
  end

  def edit_draft
    @draft = find_draft
    redirect_to :action => :index
  end

  private 

  def find_draft
    session[:draft] ||= Draft.new()
  end
end
