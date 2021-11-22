class Biblioteca < ApplicationRecord
    validates :titulo, presence: true
    validates :autor, presence: true 
    validates :estado, presence: true
end
