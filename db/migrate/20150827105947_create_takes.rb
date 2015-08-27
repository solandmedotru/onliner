class CreateTakes < ActiveRecord::Migration
  def change
    create_table :takes do |t|
      t.boolean :onlaine
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
