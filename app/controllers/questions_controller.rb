class QuestionsController < ApplicationController
  require "json"
  require "open-uri"

  before_action :set_question, except: [:edit, :renewal]

  BASE_URL = 'https://poropi.net/~webadm/exec/select_question'

  RUBY_SILVER_PARAMS = '?private_id=111733705892683188804&quiz_id=49715a2362c000e8c&version=2'

  def solution
  end

  def result
  end

  def edit
  end

  def renewal
    get_questions!
    redirect_to action: 'edit'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.includes(:answers).find(params[:question_id])
  end

  def get_questions!
    response = open(BASE_URL + RUBY_SILVER_PARAMS)
    json = JSON.load(response)['result']
    case json['err_code']
    when 0
      Question.all_update!(json['question_data'])
    when 1
      @result_message = 'error!!'
    else
      @result_message = 'error??'
    end
  end

end
