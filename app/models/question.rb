class Question < ApplicationRecord
  belongs_to :genre
  has_many :answers
end
