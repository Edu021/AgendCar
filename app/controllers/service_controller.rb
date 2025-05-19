class ServiceController < ApplicationController
  def index
    @carros = current_user.carros if current_user
  end
end
