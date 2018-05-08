class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.references :language_from, foreign_key: { to_table: :languages }, index: true
      t.references :language_to, foreign_key: { to_table: :languages }, index: true
      t.string :subject
      t.text :description
      t.decimal :price
      t.datetime :paid_at
      t.string :stripe_charge_id
      t.datetime :completed_at

      t.timestamps
    end
  end
end
