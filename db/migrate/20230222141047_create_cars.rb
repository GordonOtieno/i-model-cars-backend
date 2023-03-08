class CreateCars < ActiveRecord::Migration[7.0]
  enable_extension 'hstore' unless extension_enabled?('hstore')
  def change
    create_table :cars do |t|
      t.string :name
      t.string :car_type
      t.string :make
      t.text :description
      t.hstore :images
      t.decimal :cost
      t.integer :speed
      t.string :color, array: true, default: []

      t.timestamps
    end
  end
end
