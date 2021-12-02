class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find_by(id: params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      flash[:notice] = "Candidate created!"
      redirect_to '/candidates'
    else
      # NG
      render :new
    end  
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(candidate_params)
      flash[:notice] = "Candidate update!"
      redirect_to '/candidates'
    else
      render :edit
    end
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end  

end  