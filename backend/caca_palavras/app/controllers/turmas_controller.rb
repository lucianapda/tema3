# encoding: utf-8
class TurmasController < ApplicationController
  respond_to :json

  def index
    @turmas = Turma.select(:id, :nome)
    @turmas = @turmas.where(params[:filters])

    respond_with @turmas
  end

  def create
    turma = Turma.new(params[:turma].permit!)
    if turma.save
      render json: turma.id
    else
      render json: turma.errors, status: :unprocessable_entity
    end
  end

  def show
    @turma = Turma.select(:id, :nome).find(params[:id])
    respond_with @turma
  end

  def update
    turma = Turma.find(params[:id])
    if turma.update_attributes(params[:turma].permit(:nome))
      render json: turma.id
    else
      render json: turma.errors, status: :unprocessable_entity
    end
  end
end