class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :about
      t.string :price
      t.string :rating
      t.string :age_group

      t.timestamps
    end
  end
end
