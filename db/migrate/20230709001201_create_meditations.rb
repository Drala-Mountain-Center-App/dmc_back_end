class CreateMeditations < ActiveRecord::Migration[7.0]
  def change
    create_table :meditations do |t|
      t.integer :total_sitting_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
