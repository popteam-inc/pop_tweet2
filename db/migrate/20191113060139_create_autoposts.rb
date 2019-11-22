class CreateAutoposts < ActiveRecord::Migration[6.0]
  def change
    create_table :autoposts do |t|
      t.text :username
      t.text :password
      t.text :autopost_caption
      t.text :image1
      t.text :image2
      t.text :image3
      t.text :image4
      t.text :autopost_date
      t.timestamps
    end
  end
end
