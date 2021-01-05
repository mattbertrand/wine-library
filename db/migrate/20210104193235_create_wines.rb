class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :brand
      t.string :winery
      t.string :state
      t.string :county
      t.string :varietal
      t.integer :vintage
      t.integer :price

      t.timestamps null: false
    end
  end
end
