class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :contracts, dependent: :destroy
  has_many :plans, through: :contracts, dependent: :destroy

  enum role: [:guest ,:professional, :admin]
end
