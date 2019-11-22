class CreateAutofollows < ActiveRecord::Migration[6.0]
  def change
    create_table :autofollows do |t|
      t.string :keyword
      t.timestamps
    end
  end
end
