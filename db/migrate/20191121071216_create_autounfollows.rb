class CreateAutounfollows < ActiveRecord::Migration[6.0]
  def change
    create_table :autounfollows do |t|
      t.string :keyword
      t.timestamps
    end
  end
end
