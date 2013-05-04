class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :hashtag
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :tags, [:user_id]
  end
end
