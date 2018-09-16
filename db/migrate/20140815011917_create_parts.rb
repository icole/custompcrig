class CreateParts < ActiveRecord::Migration[4.2]
  def change
    create_table :parts do |t|
      t.string :type_name
      t.string :manufacturer
      t.string :model
      t.string :details
      t.string :link
      t.text :description
      t.text :amzdesc
      t.float :amzprice
      t.float :amzshipping
      t.string :incompatibleparts

      t.timestamps
    end
  end
end
