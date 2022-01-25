class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :full_name, presence: true

    has_many :mixers, dependent: :destroy
    has_many :alcohols, dependent: :destroy
    has_many :drinks, dependent: :destroy
end
