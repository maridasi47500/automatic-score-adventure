class CreateColornotes < ActiveRecord::Migration[7.1]
  def change
    create_table :colornotes do |t|
      t.string :degreenote
      t.references :color, null: false, foreign_key: true
      t.string :alteration
      t.references :score, null: false, foreign_key: true

      t.timestamps
    end
  end
end
