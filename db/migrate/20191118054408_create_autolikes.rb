class CreateAutolikes < ActiveRecord::Migration[6.0]
  def change
    create_table :autolikes do |t|
      t.string :keyword
      t.timestamps
    end
  end
end
