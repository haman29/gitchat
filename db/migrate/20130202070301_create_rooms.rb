class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :max_head_count
      t.date :created_at
      t.date :updated_at
      t.date :deleted_at
      t.boolean :del_flg
      t.integer :version

      t.timestamps
    end
  end
end
