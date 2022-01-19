class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :phone
      t.belongs_to :engagement

      t.timestamps
    end
  end
end
