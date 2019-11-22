class AddAccountRedAutofollow < ActiveRecord::Migration[6.0]
  def change
    add_reference :autofollows, :account, null: false, foreign_key: true
  end
end
