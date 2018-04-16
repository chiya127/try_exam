class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.string :detail
      t.string :correct_flag, null: false

      t.timestamps
    end
  end
end
