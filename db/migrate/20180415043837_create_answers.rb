class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.string :title, null: false
      t.string :detail
      t.boolean :correct_flag, null: false

      t.timestamps
    end
  end
end
