class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :author
      t.timestamps
    end
  end
end
