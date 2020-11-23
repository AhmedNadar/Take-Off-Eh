class AddIndustryFieldsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :advertising, :boolean
    add_column :companies, :agriculture, :boolean
    add_column :companies, :consumer_goods, :boolean
    add_column :companies, :education, :boolean
    add_column :companies, :energy_greentech, :boolean
    add_column :companies, :fashion_living, :boolean
    add_column :companies, :food_beverage, :boolean
    add_column :companies, :gaming, :boolean
    add_column :companies, :healthcare_lifeScience, :boolean
    add_column :companies, :hospitality_hosting, :boolean
    add_column :companies, :it_software, :boolean
    add_column :companies, :jobs_recruitment, :boolean
    add_column :companies, :legal, :boolean
    add_column :companies, :fintech, :boolean
    add_column :companies, :manufacturing, :boolean
    add_column :companies, :maritime_transport, :boolean
    add_column :companies, :marketplace_eCommerce, :boolean
    add_column :companies, :media_entertainment, :boolean
    add_column :companies, :music_audio, :boolean
    add_column :companies, :retail, :boolean
    add_column :companies, :robotics, :boolean
    add_column :companies, :saas, :boolean
    add_column :companies, :sales_marketing, :boolean
    add_column :companies, :science_engineering, :boolean
    add_column :companies, :service, :boolean
    add_column :companies, :sports, :boolean
    add_column :companies, :selecommunications, :boolean
    add_column :companies, :travel_tourism, :boolean
    add_column :companies, :angel_VC_firm, :boolean
    add_column :companies, :artificial_intelligence, :boolean
    add_column :companies, :automotive, :boolean
    add_column :companies, :insurance, :boolean
    add_column :companies, :animal_care, :boolean
    add_column :companies, :real_estate, :boolean
  end
end
