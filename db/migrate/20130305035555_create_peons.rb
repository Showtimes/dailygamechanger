class CreatePeons < ActiveRecord::Migration
  def change
    create_table :peons do |t|
      t.string :email
      t.string :ip_at_signup
      t.string :tracking_code
      t.string :name
      t.string :unsubscribe_token
      t.datetime :unsubscribed_at

      t.timestamps
    end
  end
end
