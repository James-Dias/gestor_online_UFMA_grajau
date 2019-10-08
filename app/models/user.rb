class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  enum kind: {secretary: 0, administrator: 1}

  validates :name, :cpf, :kind, presence: true
end
