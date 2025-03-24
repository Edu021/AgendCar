module Api
  class AppointmentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @appointments = Appointment.includes(:client, :service).all.limit(5)
      render json: @appointments.map { |a| 
        {
          id: a.id,
          cliente: a.client.nome,
          servico: a.service.nome_servico,
          data_hora: a.data_hora,
          status: a.status
        }
      }, status: :ok
    end
    
    def create
      @appointment = Appointment.new(appointment_params)

      if @appointment.save
        render json: @appointment, status: :created
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end
    
    def show
      @appointment = Appointment.find_by(id: params[:id])
      if @appointment
        render json: @appointment
      else
        render json: { error: "Appointment not found" }, status: :not_found
      end
    end

    def upcoming
      @appointments = Appointment.where("data_hora >= ?", DateTime.now).order(:data_hora).limit(5)
      render json: @appointments
    end

    private

    def appointment_params
      params.require(:appointment).permit(:client_id, :service_id, :data_hora, :status)
    end
  end
end
