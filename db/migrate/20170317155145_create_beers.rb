class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.float :abw, null: false
      t.boolean :empty, default: false
      t.string :style, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
