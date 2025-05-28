class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :status, default: "New"
      t.integer :priority
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
