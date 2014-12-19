Fabricator(:user) do
	#id { (1..4).to_a.sample }
	name { Faker::Name.name }
	email { Faker::Internet.email }
	password { Faker::Internet.password }
end