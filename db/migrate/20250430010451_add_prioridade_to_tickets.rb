class AddPrioridadeToTickets < ActiveRecord::Migration[8.0]
  def change
    add_column :tickets, :prioridade, :string
  end
end
