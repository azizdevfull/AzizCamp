class CreatePcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :pcomments do |t|
      t.string :name
      t.belongs_to :poster, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
