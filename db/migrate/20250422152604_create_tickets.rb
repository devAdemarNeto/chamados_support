class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :titulo
      t.text :descricao
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
