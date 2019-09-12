class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.references :sector, foreign_key: true
      t.references :problem, foreign_key: true
      t.integer :status
      t.text :description

      t.timestamps
    end
  end
end
