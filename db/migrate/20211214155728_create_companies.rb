class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :website
      t.string :short_name
      t.string :full_name
      t.string :city
      t.string :address
      t.references :engagement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
