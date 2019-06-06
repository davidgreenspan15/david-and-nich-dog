class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :category
      t.belongs_to :owner, foreign_key: true

      t.timestamps
    end
  end
end
