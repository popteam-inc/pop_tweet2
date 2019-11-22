class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :provider
      t.string :uid
      t.string :user_name
      t.text :image_url
      t.string :token
      t.string :secret
      t.timestamps
    end
  end
end
