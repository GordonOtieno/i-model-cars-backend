class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :type
      t.string :make
      t.text :description
      t.string :image
      t.decimal :cost
      t.integer :speed
      t.string :color

      t.timestamps
    end
  end
end
