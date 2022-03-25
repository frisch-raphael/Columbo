class CreateTemplateFindings < ActiveRecord::Migration[6.1]
  def change
    create_table :template_findings do |t|
      t.string :title
      t.string :description
      t.string :assessment_type
      t.string :finding_type
      t.string :hacker_profile
      t.string :remediation_effort
      t.string :remediation_description

      t.timestamps
    end
  end
end
