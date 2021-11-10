class CreateAdvices < ActiveRecord::Migration[6.0]
  def change
    create_table :advices do |t|
      t.string :title, null: false
      t.text :description, null: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
