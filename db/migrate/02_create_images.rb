class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :src
      t.integer :user_id
    end
  end
end
