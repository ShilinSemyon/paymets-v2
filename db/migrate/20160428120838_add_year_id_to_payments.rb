class AddYearIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :year, :integer
  end
end
