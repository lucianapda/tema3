# encoding: utf-8
class UsuariosController < ApplicationController
  respond_to :json

  def index
    @usuarios = Usuario.select(:id, :nome, :email, :tipo)
    @usuarios = @usuarios.where(params[:filters])

    respond_with @usuarios
  end

  def show
    usuario = Usuario.select(:id, :nome, :email, :tipo).find(params[:id])
    respond_with usuario
  end
end