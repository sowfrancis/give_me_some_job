Fabricator(:user) do 
	userimg File.new(Rails.root.join('app', 'assets', 'images', 'Dont.png'))
  firstname "Francis"
 	lastname "Sow"
 	description "Yo"
  email "sow@gmail.com"
  password 'changeme'
  password_confirmation 'changeme'
  latitude "48.866667"
  longitude "2.333333"
	address "Paris, France"
end