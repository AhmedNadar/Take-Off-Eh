class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :job_type
      t.string :link_to_apply
      t.string :category
      t.string :region
      t.string :company_statement
      t.string :status, default: "pending"
      t.boolean :remote, default: false
      t.integer :price
      t.datetime :published_at
      t.datetime :featured_until
      t.boolean :featured, default: false
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
