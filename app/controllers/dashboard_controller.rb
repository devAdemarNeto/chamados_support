class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = Ticket.all.order(created_at: :desc)
  end
end
