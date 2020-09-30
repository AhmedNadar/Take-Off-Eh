class AddFieldsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :headquarter, :string
    add_column :companies, :company_size, :integer
    add_column :companies, :phone_number, :string
    add_column :companies, :business_model, :string
    add_column :companies, :stage, :string
    add_column :companies, :industry, :string
  end
end
