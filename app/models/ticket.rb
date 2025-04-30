class Ticket < ApplicationRecord
  belongs_to :user

  before_validation :set_default_status, on: :create

  validates :titulo, presence: true
  validates :descricao, presence: true  
  validates :user_id, presence: true

  private

  def set_default_status
    self.status ||= "aberto"
  end
end
