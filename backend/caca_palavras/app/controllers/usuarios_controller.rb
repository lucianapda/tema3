# encoding: utf-8
class UsuariosController < ApplicationController
  respond_to :json

  def index
    usuarios = Usuario.select(:id, :nome, :email, :tipo).all

    respond_with usuarios
  end

  def show
    @usuario = Usuario.select(:id, :nome, :email, :tipo).includes(:notas).find(params[:id])
  end
end