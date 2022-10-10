class RemoveTotalPriceFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :total_price, :integer
  end
end
