class AddAccountRefAutolikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :autolikes, :account, null: false, foreign_key: true
  end
end
