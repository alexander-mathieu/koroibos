class CreateOlympianSports < ActiveRecord::Migration[5.2]
  def change
    create_table :olympian_sports do |t|
      t.references :olympian, foreign_key: true
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
