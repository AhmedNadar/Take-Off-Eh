class RemoveIndustriesFromCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :advertising, :boolean
    remove_column :companies, :agriculture, :boolean
    remove_column :companies, :consumer_goods, :boolean
    remove_column :companies, :education, :boolean
    remove_column :companies, :energy_greentech, :boolean
    remove_column :companies, :fashion_living, :boolean
    remove_column :companies, :food_beverage, :boolean
    remove_column :companies, :gaming, :boolean
    remove_column :companies, :healthcare_lifeScience, :boolean
    remove_column :companies, :hospitality_hosting, :boolean
    remove_column :companies, :it_software, :boolean
    remove_column :companies, :jobs_recruitment, :boolean
    remove_column :companies, :legal, :boolean
    remove_column :companies, :fintech, :boolean
    remove_column :companies, :manufacturing, :boolean
    remove_column :companies, :maritime_transport, :boolean
    remove_column :companies, :marketplace_eCommerce, :boolean
    remove_column :companies, :media_entertainment, :boolean
    remove_column :companies, :music_audio, :boolean
    remove_column :companies, :retail, :boolean
    remove_column :companies, :robotics, :boolean
    remove_column :companies, :saas, :boolean
    remove_column :companies, :sales_marketing, :boolean
    remove_column :companies, :science_engineering, :boolean
    remove_column :companies, :service, :boolean
    remove_column :companies, :sports, :boolean
    remove_column :companies, :selecommunications, :boolean
    remove_column :companies, :travel_tourism, :boolean
    remove_column :companies, :angel_VC_firm, :boolean
    remove_column :companies, :artificial_intelligence, :boolean
    remove_column :companies, :automotive, :boolean
    remove_column :companies, :insurance, :boolean
    remove_column :companies, :animal_care, :boolean
    remove_column :companies, :real_estate, :boolean
  end
end
