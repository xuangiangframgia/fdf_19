class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :status
      t.float :discount
      t.string :image
      t.text :description
      t.float :rate
      t.datetime :created_at
      t.datetime :updated_at
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
