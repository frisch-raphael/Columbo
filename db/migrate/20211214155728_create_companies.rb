class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :Website
      t.string :Name
      t.string :City
      t.string :Address

      t.timestamps
    end
  end
end
