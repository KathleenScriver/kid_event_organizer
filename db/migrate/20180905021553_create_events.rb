class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :day_of_week
      t.time :time
      t.text :description
      t.references :kid, foreign_key: true
    end
  end
end
