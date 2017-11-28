# encoding: utf-8
class TeansController < ApplicationController
  respond_to :json

  before_action :authenticate_user!

  def index
    teams = Team.select(:id, :name)
    teams = teams.where(params[:filters])

    respond_with teams
  end

  def create
    team = Team.new(params[:team].permit!)
    if team.save
      render json: team.id
    else
      render json: team.errors, status: :unprocessable_entity
    end
  end

  def show
    @team = Team.select(:id, :name).find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    if team.update_attributes(params[:team].permit(:name))
      render json: team.id
    else
      render json: team.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    render json: :ok
  end
end
