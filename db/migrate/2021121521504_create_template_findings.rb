class CreateTemplateFindings < ActiveRecord::Migration[6.1]
  def change
    create_table :template_findings do |t|
      t.string :title
      t.string :description
      t.integer :assessment_type
      t.integer :finding_type
      t.integer :hacker_profile
      t.integer :remediation_effort
      t.string :remediation_description

      t.timestamps
    end
  end
end
