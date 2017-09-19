# encoding: utf-8
class UsuariosController < ApplicationController
  respond_to :json

  def index
    usuarios = Usuario.select(:id, :nome, :email, :tipo).all

    respond_with usuarios
  end

  def create
    usuario = Usuario.new(params[:usuario].permit!)
    if usuario.save
      render json: usuario.id
    else
      render json: usuario.errors, status: :unprocessable_entity
    end
  end

  def show
    @usuario = Usuario.select(:id, :nome, :email, :tipo).includes(:notas).find(params[:id])
  end

  def update
    usuario = Usuario.find(params[:id])
    if usuario.update_attributes(params[:usuario].permit(:nome))
      render json: usuario.id
    else
      render json: usuario.errors, status: :unprocessable_entity
    end
  end
end
