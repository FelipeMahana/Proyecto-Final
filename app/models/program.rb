class Program < ApplicationRecord
  belongs_to :contract, dependent: :destroy
end
