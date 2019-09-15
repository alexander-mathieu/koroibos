class AddMedalIndexToOlympianEvents < ActiveRecord::Migration[5.2]
  def change
    add_index :olympian_events, :medal
  end
end
