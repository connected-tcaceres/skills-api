class TrainingSessionsController < ApplicationController
  before_action :set_training_session, only: [:show, :update, :destroy]

  # GET /training_sessions
  def index
    @training_sessions = TrainingSession.all

    render json: @training_sessions
  end

  # GET /training_sessions/1
  def show
    render json: @training_session
  end

  # POST /training_sessions
  def create
    @training_session = TrainingSession.new(training_session_params)

    if @training_session.save
      render json: @training_session, status: :created, location: @training_session
    else
      render json: @training_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /training_sessions/1
  def update
    if @training_session.update(training_session_params)
      render json: @training_session
    else
      render json: @training_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /training_sessions/1
  def destroy
    @training_session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_session
      @training_session = TrainingSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_session_params
      params.require(:training_session).permit(:skill_id, :notes, :duration_hours)
    end
end
