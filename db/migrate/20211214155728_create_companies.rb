class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :full_name
      t.string :short_name
      t.string :city
      t.string :address
      t.string :website

      t.timestamps
    end
  end
end
