class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :name
      t.integer :user_id
    end
  end
end
