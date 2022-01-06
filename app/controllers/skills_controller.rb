class SkillsController < ApplicationController
  before_action :set_skill, only: [:show]

  # GET /skills
  def index
    @skills = Skill.all
    puts skills_url
    render json: @skills
  end

  # GET /skills/1
  def show
    render json: @skill
  end

  # POST /skills
  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      render(json: @skill, status: :created, location: @skill)
    else
      render(json: @skill.errors, status: :unprocessable_entity)
    end
  end

  # GET /skills/strong
  def strong
    render json: Skill.strong.pluck(:name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(:name, :level)
    end
end
