module Api
  class AppointmentsController < ApplicationController
    def index
      @appointments = Appointment.includes(:client, :service).all
      render json: @appointments.map { |a| 
        {
          cliente: a.client.nome,
          servico: a.service.nome_servico,
          data_hora: a.data_hora,
          status: a.status
        }
      }, status: :ok
    end
  end
end
