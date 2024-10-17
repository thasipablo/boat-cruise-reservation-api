class CreateBoats < ActiveRecord::Migration[7.1]
  def change
    create_table :boats do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :finance
      t.decimal :option
      t.integer :duration
      t.decimal :amount
      t.boolean :availability

      t.timestamps
    end
  end
end
