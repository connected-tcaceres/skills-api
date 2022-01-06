class CreateTrainingSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :training_sessions do |t|
      t.references :skill, null: false, foreign_key: true
      t.text :notes
      t.decimal :duration_hours, precision: 4, scale: 2

      t.timestamps
    end
  end
end
