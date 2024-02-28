class CreateBoats < ActiveRecord::Migration[7.1]
  def change
    create_table :boats do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :finance_fee
      t.decimal :option_to_purchase_fee
      t.integer :duration
      t.decimal :amount_payable
      t.boolean :availability

      t.timestamps
    end
  end
end
