class Ticket < ApplicationRecord
  belongs_to :user

  validates :titulo, presence: true
  validates :descricao, presence: true
  validates :status, presence: true
end
