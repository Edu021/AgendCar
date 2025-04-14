class Carro < ApplicationRecord
    belongs_to :dono, class_name: "Client", foreign_key: "dono_id"
end
  