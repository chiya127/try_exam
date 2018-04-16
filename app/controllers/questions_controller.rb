class QuestionsController < ApplicationController
  before_action :set_question

  def solution
  end

  def result
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.includes(:answers).find(params[:question_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def question_params
  #   params.fetch(:question, {})
  # end
end
