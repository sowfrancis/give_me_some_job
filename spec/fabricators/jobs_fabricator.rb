Fabricator(:job) do
  name   "Bolloré"
  description   "Hey"
  jobimg  File.new(Rails.root.join('app', 'assets', 'images', 'Dont.png'))
  latitude 	"48.866667"
	longitude "2.333333"
	address	"Paris,France"
  contact	"0707070707"
end