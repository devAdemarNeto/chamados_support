class TicketsController < ApplicationController
  before_action :authenticate_user!

  # GET /tickets or /tickets.json
  def index
    order = params[:order] == 'asc' ? :asc : :desc
    @tickets = Ticket.order(created_at: order) # Ordenação dinâmica

    if params[:status].present?
      @tickets = @tickets.where(status: params[:status])
    end

    if params[:query].present?
      @tickets = @tickets.where('LOWER(titulo) LIKE LOWER(?) OR LOWER(descricao) LIKE LOWER(?)', "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = current_user.tickets.build(ticket_params)
  
    if @ticket.save
      redirect_to @ticket, notice: "Ticket was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Chamado atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_url, notice: 'Chamado excluído com sucesso.'
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
    

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:titulo, :descricao, :status, :prioridade)
    end
    
end
