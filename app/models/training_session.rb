class TrainingSession < ApplicationRecord
  belongs_to :skill

   NEXT_LEVEL = {
    'beginner' => 'intermediate',
    'intermediate' => 'advanced',
    'advanced' => 'advanced',
  }

  after_create :increment_skill_level!

  private

  def increment_skill_level!
    skill.update!(level: NEXT_LEVEL[skill.level])
  end
end
