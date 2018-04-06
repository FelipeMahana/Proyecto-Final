class Contract < ApplicationRecord
  has_many :programs
  belongs_to :user
  belongs_to :plan, dependent: :destroy
  belongs_to :billing, optional: true
end
