class CarController < ApplicationController
  before_action :set_carro, only: [:edit, :update]

  def index
    @carro = Carro.new
  end

  def create
    @carro = current_user.carros.build(carro_params)
    if @carro.save
      redirect_to service_path, notice: 'Veículo cadastrado com sucesso!' # Or wherever you want to redirect
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    # @carro is set by before_action
    # Ensure the car belongs to the current_user for security
    unless @carro.dono == current_user
      redirect_to service_path, alert: "Acesso não autorizado."
      return
    end
  end

  def update
    # Ensure the car belongs to the current_user for security
    unless @carro.dono == current_user
      render json: { status: 'error', message: 'Acesso não autorizado.' }, status: :forbidden
      return
    end

    if @carro.update(carro_params)
      render json: { status: 'ok', message: 'Veículo atualizado com sucesso!', carro: @carro }, status: :ok
    else
      render json: { status: 'error', errors: @carro.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_carro
    @carro = Carro.find_by(id: params[:id])
    unless @carro
      # If sending JSON response for an API-like update
      # render json: { status: 'error', message: 'Veículo não encontrado.' }, status: :not_found
      # For HTML redirect (e.g. if edit was a page)
      redirect_to service_path, alert: 'Veículo não encontrado.'
    end
  end

  def carro_params
    params.require(:carro).permit(:placa, :marca, :modelo, :tipo, :cor)
  end
end
