# encoding: utf-8
class WordHuntsController < ApplicationController
  respond_to :json

  before_action :authenticate_user!

  def index
    word_hunts = WordHunt.select(:id, :name, :teacher_id)
    @word_hunts = word_hunts.where(params[:filters])
  end

  def create
    word_hunt = WordHunt.new(params[:word_hunt].permit!)
    if word_hunt.save
      render json: word_hunt.id
    else
      render json: word_hunt.errors, status: :unprocessable_entity
    end
  end

  def show
    @word_hunt = WordHunt.includes(:words, :teacher, :team).find(params[:id])
    @words = @word_hunt.words.map(&:word)
  end

  def update
    word_hunt = WordHunt.find(params[:id])

    if word_hunt.update_attributes(params[:word_hunt].permit(:name, words_attributes: [:id, :word, :_destroy]))
      render json: word_hunt.id
    else
      render json: word_hunt.errors, status: :unprocessable_entity
    end
  end

  def destroy
    WordHunt.where(id: params[:id]).destroy
    render nothing: true
  end

  def valid_words
    word_hunt = WordHunt.find(params[:id])

    render json: { grade: word_hunt.apply_grade(params[:student_id], params[:words_found]) }, status: :ok
  end
end
