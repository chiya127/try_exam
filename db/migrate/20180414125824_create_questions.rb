class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :genre_id, null: false
      t.string :category_name, null: false
      t.string :title, null: false
      t.string :detail
      t.string :question_img_url
      t.string :consult_name
      t.string :consult_url

      t.timestamps
    end
  end
end
