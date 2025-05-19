class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update(profile_params)
      render json: { status: 'ok', message: 'Perfil atualizado com sucesso!', user: current_user.as_json(only: [:nome, :email, :telefone]) }, status: :ok
    else
      render json: { status: 'error', errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:client).permit(:telefone)
  end
end 