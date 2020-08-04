class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :user_id
      t.boolean :completed
      t.timestamps
    end
  end
end
