class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.text :subject
      t.text :description
      t.string :lang_from
      t.string :lang_to
      t.decimal :price
      t.boolean :paid
      t.text :file_data
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
