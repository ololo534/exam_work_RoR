class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :text
      t.string :time_work

      t.timestamps
    end
  end
end
