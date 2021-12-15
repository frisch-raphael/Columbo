class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Title
      t.string :Phone
      t.references :Company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
