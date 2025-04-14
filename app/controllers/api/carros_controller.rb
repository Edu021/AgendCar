class Api::CarrosController < ApplicationController
  protect_from_forgery with: :null_session  # Permite requisições sem token CSRF
  
  def index
    carros = Carro.all
    render json: carros
  end
  
  def show
    carro = Carro.find(params[:id])
    render json: carro
  end

  def create
    carro = Carro.new(carro_params)
  
    if carro.save
      render json: { status: "ok", carro: carro }
    else
      render json: { status: "erro", erros: carro.errors.full_messages }, status: 422
    end
  end
  
  private
  
  def carro_params
    params.permit(:placa, :tipo, :marca, :modelo, :cor, :dono_id)
  end
end
