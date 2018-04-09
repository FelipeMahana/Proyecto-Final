class Plan < ApplicationRecord
	has_many :contracts, dependent: :destroy
  	has_many :users, through: :contracts, dependent: :destroy
end
