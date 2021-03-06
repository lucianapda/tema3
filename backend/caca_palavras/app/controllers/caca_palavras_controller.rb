# encoding: utf-8
class CacaPalavrasController < ApplicationController
  respond_to :json

  def index
    caca_palavras = CacaPalavra.select(:id, :nome)
    caca_palavras = caca_palavras.where(params[:filters])

    respond_with caca_palavras
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
    @caca_palavra = CacaPalavra.includes(:palavras, :professor, :turma).find(params[:id])
  end

  def update
    caca_palavra = CacaPalavra.find(params[:id])

    if caca_palavra.update_attributes(params[:caca_palavra].permit(:nome, palavras_attributes: [:id, :palavra, :_destroy]))
      render json: caca_palavra.id
    else
      render json: caca_palavra.errors, status: :unprocessable_entity
    end
  end

  def destroy
    CacaPalavra.where(id: params[:id]).destroy
    render nothing: true
  end

  def valida_palavras
    caca_palavra = CacaPalavra.find(params[:id])

    render json: { nota: caca_palavra.registra_nota(params[:aluno_id], params[:palavras_encontradas]) }, status: :ok
  end
end
