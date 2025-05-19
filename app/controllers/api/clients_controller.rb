class Api::ClientsController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def index
        clients = Client.all
        render json: clients
    end
    
    def getByEmail
      clients = Client.email(client_params)
    end

    def create
      @client = Client.new(client_params)
  
      if @client.save
        session[:user_id] = @client.id
        render json: { status: 'ok', client: @client, token: @client.generate_auth_token }, status: :created
      else
        render json: { status: 'error', errors: @client.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def client_params
        params.require(:client).permit(:nome, :email, :telefone, :password, :password_confirmation)
    end      
  end
  