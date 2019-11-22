class AddAccountRefAutounfollows < ActiveRecord::Migration[6.0]
  def change
    add_reference :autounfollows, :account, null: false, foreign_key: true
  end
end
