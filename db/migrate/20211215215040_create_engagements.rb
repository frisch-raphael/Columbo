class CreateEngagements < ActiveRecord::Migration[6.1]
  def change
    create_table :engagements do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :scoring
      t.string :language
      t.integer :state

      t.timestamps
    end
  end
end