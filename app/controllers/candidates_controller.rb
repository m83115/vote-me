class CandidatesController < ApplicationController

  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all
  end

  def show
    
  end

  def new
    @candidate = Candidate.new
  end

  def create
    

    if @candidate.save
      redirect_to '/candidates', notice: 'Candidate created!'
    else
      # NG
      render :new
    end  
  end

  def edit
    
  end

  def update
    

    if @candidate.update(candidate_params)
      redirect_to '/candidates', notice: 'Candidate created!'
    else
      render :edit
    end
  end

  def destroy  
    @candidate.destroy
    redirect_to '/candidates', notice: 'Candidate created!'
  end

  def vote
    # VoteLog.create(candidate: @candidate, ip_address: request.remote_ip)
    @candidate.vote_logs.create(ip_address: request.remote_ip)
    redirect_to '/candidates', notice: 'Votde!'
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end
  
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end  