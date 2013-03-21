class CreateChangers < ActiveRecord::Migration
  def change
    create_table :changers do |t|
      t.string :title
      t.string :caption
      t.string :url
      t.string :youtube_id
      t.string :user_id
      t.datetime :last_used_at
      t.boolean :disabled
      t.integer :rank
      t.integer :start_seconds
      t.integer :end_seconds

      t.timestamps
    end
  end
end
