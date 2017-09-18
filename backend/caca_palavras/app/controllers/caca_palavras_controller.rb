# encoding: utf-8
class CacaPalavrasController < ApplicationController
  respond_to :json

  def index
    @caca_palavras = CacaPalavra.select(:id, :nome)
    @caca_palavras = @caca_palavras.where(params[:filters])

    respond_with @caca_palavras
  end

  def create
    caca_palavra = CacaPalavra.new(params[:caca_palavra].permit!)
    if caca_palavra.save
      render json: caca_palavra.id
    else
      render json: caca_palavra.errors, status: :unprocessable_entity
    end
  end

  def show
    @caca_palavra = CacaPalavra.select(:id, :nome).find(params[:id])
    respond_with @caca_palavra
  end

  def update
    caca_palavra = CacaPalavra.find(params[:id])
    if caca_palavra.update_attributes(params[:caca_palavra].permit(:nome))
      render json: caca_palavra.id
    else
      render json: caca_palavra.errors, status: :unprocessable_entity
    end
  end
end