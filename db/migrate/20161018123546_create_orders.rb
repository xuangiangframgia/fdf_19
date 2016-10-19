class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.boolean :status
      t.text :message
      t.datetime :created_at
      t.datetime :updated_at
      t.float :order_total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
