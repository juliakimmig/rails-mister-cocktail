class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.string :name
      t.references :cocktail, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
