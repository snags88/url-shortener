class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :original
      t.string :shortened
      t.integer :views, default: 0

      t.timestamps null: false
    end
  end
end
