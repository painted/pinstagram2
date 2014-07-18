class AddAmountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :amount, :float
  end
end
