class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :abbreviation
      t.date :anno
      t.integer :total_area

      t.timestamps
    end
  end
end
