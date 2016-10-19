class CreateSuggests < ActiveRecord::Migration[5.0]
  def change
    create_table :suggests do |t|
      t.string :name
      t.text :body
      t.string :image
      t.float :price
      t.boolean :status
      t.datetime :created_at
      t.datetime :updated_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
