class CreateEngagements < ActiveRecord::Migration[6.1]
  def change
    create_table :engagements do |t|
      t.string :title
      t.string :assessment_type
      t.date :start_date
      t.date :end_date
      t.string :scoring
      t.string :language
      t.string :state
      t.references :company, null: true, foreign_key: true

      t.timestamps
    end
  end
end
