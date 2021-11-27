class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :title
      t.string :animal_image_id
      t.string :body
      t.integer :user_id
      t.timestamps
    end
  end
end
