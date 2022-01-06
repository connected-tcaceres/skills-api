class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :update, :destroy]

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

  class SkillCreateService
    def initialize(params)
      @params = params
    end

    def create
      skill = Skill.new(@params)

      if skill.save
        return { json: skill, status: :created, location: skill }
      else
        return { json: skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /skills
  def create
    render SkillCreateService.new(skill_params).create
    # @skill = Skill.new(skill_params)

    # if @skill.save
    #   render(json: @skill, status: :created, location: @skill)
    # else
    #   render(json: @skill.errors, status: :unprocessable_entity)
    # end
  end

  # PATCH/PUT /skills/1
  def update
    if @skill.update(skill_params)
      render json: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /skills/1
  def destroy
    @skill.destroy
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
