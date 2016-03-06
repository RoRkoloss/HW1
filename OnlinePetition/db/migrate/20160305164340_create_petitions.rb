class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
