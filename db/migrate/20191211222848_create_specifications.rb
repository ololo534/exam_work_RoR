class CreateSpecifications < ActiveRecord::Migration[5.2]
  def change
    create_table :specifications do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :count

      t.timestamps
    end
  end
end
