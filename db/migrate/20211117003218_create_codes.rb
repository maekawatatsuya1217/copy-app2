class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.string :title,        null: false
      t.string :catch_copy,   null: false
      t.text :article,        null:false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
