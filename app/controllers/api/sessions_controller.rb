class Api::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      client = Client.find_by(email: params[:email])
  
      if client&.authenticate(params[:password])
        session[:user_id] = client.id
        token = generate_token(client)
        render json: { status: "ok", client: client, token: token }
      else
        render json: { status: "erro", message: "Email ou senha inválidos" }, status: 401
      end
    end
  
    private
  
    def generate_token(client)
      JWT.encode({ client_id: client.id, exp: 24.hours.from_now.to_i }, Rails.application.secret_key_base)
    end
  end
  