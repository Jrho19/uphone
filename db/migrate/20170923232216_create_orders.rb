class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.float :shipping_fee

      t.timestamps
    end
  end
end
