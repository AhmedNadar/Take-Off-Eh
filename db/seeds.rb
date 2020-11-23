# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Role.create!(name: :admin)
Role.create!(name: :client)

user1 = User.create!(email:                 'admin@mail.com',
										first_name:             'ahmed',
										last_name:              'nadar',
					          password:               'password123',
                    password_confirmation:  'password123')
user1.add_role(:admin)

user2 = User.create!(email:                 'client@mail.com',
										first_name:             'client',
										last_name:              'nadar',
					          password:               'password123',
					          password_confirmation:  'password123')
user2.add_role(:client)


Industry.destroy_all
Industry.create!([
	{name: 'Advertising'},
	{name: 'Agriculture'},
	{name: 'Consumer & Goods'},
	{name: 'Education'},
	{name: 'Energy & Greentech'},
	{name: 'Fashion & Living'},
	{name: 'Food & Beverage'},
	{name: 'Gaming'},
	{name: 'Healthcare & LifeScience'},
	{name: 'Hospitality & Hosting'},
	{name: 'IT & Software'},
	{name: 'Jobs & Recruitment'},
	{name: 'Fintech'},
	{name: 'Manufacturing'},
	{name: 'Maritime & Transport'},
	{name: 'Marketplace & eCommerce'},
	{name: 'Media & Entertainment'},
	{name: 'Music & Aaudio'},
	{name: 'SaaS'},
	{name: 'Retail'},
	{name: 'Robotics'},
	{name: 'Sales & Marketing'},
	{name: 'Science & Engineering'},
	{name: 'Service'},
	{name: 'Sports'},
	{name: 'Selecommunications'},
	{name: 'Travel & Tourism'},
	{name: 'Angel & VC Firm'},
	{name: 'Artificial & Intelligence'},
	{name: 'Automotive'},
	{name: 'Insurance'},
	{name: 'Animal Care'},
	{name: 'Real Estat'}
])	
p "Created #{Industry.count} industries"


# Stage.destroy_all
# Stage.create!([
# 	{name: 'Idea'},
# 	{name: 'Product or prototype'},
# 	{name: 'Go to market'},
# 	{name: 'Growth and expansion'}
# ])	
# p "Created #{Stage.count} stages"