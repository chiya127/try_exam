class Question < ApplicationRecord
  belongs_to :genre
  has_many :answers

  def self.all_update!(questions)
    questions.each do |question|
      self.create!(genre_id: 1, category_name: question['category_name'], title: question['question_title'], detail: question['question_value'] ,question_img_url: nil, consult_name: nil, consult_url: question['consult_url'])
    end
  end
end
