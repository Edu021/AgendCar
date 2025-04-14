class Client < ApplicationRecord
  has_many :appointments
  has_many :carros, foreign_key: "dono_id"

  validates :email, presence: true, uniqueness: true
  
  has_secure_password

  def generate_auth_token
    JWT.encode({ client_id: self.id, exp: 24.hours.from_now.to_i }, Rails.application.secret_key_base)
  end
end
