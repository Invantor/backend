class CreateAlcohols < ActiveRecord::Migration[6.1]
  def change
    create_table :alcohols do |t|
      t.string :name, null: false
      t.integer :volume_in_ml, null: false
      t.integer :critical_volume, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
