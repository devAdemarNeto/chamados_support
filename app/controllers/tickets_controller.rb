class TicketsController < ApplicationController
  before_action :authenticate_user!

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all

    if params[:status].present?
      @tickets = @tickets.where(status: params[:status])
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
    @ticket = Ticket.new(ticket_params)
  
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
    if @ticket.destroy
      respond_to do |format|
        format.html { redirect_to tickets_path, notice: "Ticket was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to tickets_path, alert: "Não foi possível excluir o ticket." }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
    

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:titulo, :descricao, :status, :user_id)
    end
    
end
