# encoding: utf-8
class UsuariosController < ApplicationController
  respond_to :json

  def index
    usuarios = Usuario.select(:id, :nome, :email, :tipo)

    usuarios = usuarios.where(nome: params[:filters][:nome]) if params[:filters][:nome].present?
    usuarios = usuarios.where(email: params[:filters][:email]) if params[:filters][:email].present?
    usuarios = usuarios.where(tipo: params[:filters][:tipo]) if params[:filters][:tipo].present?

    respond_with usuarios
  end

  def show
    usuario = Usuario.select(:id, :nome, :email, :tipo).find(params[:id])
    respond_with usuario
  end
end