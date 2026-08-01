class CreateScores < ActiveRecord::Migration[7.1]
  def change
    create_table :scores do |t|
      t.string :title
      t.string :composer
      t.string :time_signature
      t.string :key_signature
      t.string :content
      t.string :adventure_description

      t.timestamps
    end
  end
end
