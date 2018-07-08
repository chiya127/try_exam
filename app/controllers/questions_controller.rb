class QuestionsController < ApplicationController
  require "json"
  require "open-uri"

  before_action :set_questions, except: [:edit, :renewal]

  BASE_URL = 'https://poropi.net/~webadm/exec/select_question'

  RUBY_SILVER_OPTIONS = {
    name: 'Ruby Silver',
    url_params: '?private_id=111733705892683188804&quiz_id=49715a2362c000e8c&version=1'
  }

  RUBY_GOLD_OPTIONS = {
    name: 'Ruby Gold',
    url_params: '?private_id=111733705892683188804&quiz_id=49715a2362c000e8c&version=2'
  }

  CCNA_OPTIONS = {
    name: 'CCNA',
    url_params: '?private_id=116449519389305765867&quiz_id=98145a2bb69470b86&version=1'
  }

  QUESTION_OPTIONS = [
    RUBY_SILVER_OPTIONS,
    RUBY_GOLD_OPTIONS,
    CCNA_OPTIONS
  ]

  def solution
    #@questions = @questions.paginate(page: params[:page], per_page: 10, total_entries: limit)
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
  def set_questions
    limit = params[:limit] || 50
    @questions = Question.where(genre_id: params[:genre_id]).includes(:answers).limit(limit).order("RANDOM()")
  end

  def get_questions!
    Genre.delete_all
    Question.delete_all
    QUESTION_OPTIONS.each do |question_option|
      response = open(BASE_URL + question_option[:url_params])
      json = JSON.load(response)['result']

      case json['err_code']
      when 0
        Question.all_update!(json['question_data'], question_option[:name])
      when 1
        @result_message = 'error!!'
      else
        @result_message = 'error??'
      end
    end
  end

end
