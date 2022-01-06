class AlterSkillsSetNullConstraintOnName < ActiveRecord::Migration[6.1]
  def change
    change_column_null :skills, :name, false
  end
end
