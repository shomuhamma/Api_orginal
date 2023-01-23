class CreateProLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :pro_languages do |t|
      t.string :name
      t.string :creator

      t.timestamps
    end
  end
end
