class User < ApplicationRecord
    validates :first_name, presence: true
    validates :email, presence: true,uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Merci d'inserer un email valide" }
    validates :age, presence: true, format: {with: /[0-9]{2}/, message: "l'age doit etre ecrit avec 2 chiffres"}
    validates :password, presence: true, length: { minimum: 6 }

    belongs_to :city
    has_many :gossips, dependent: :destroy
    has_secure_password
end
