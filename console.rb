require("pry")
require_relative("models/artist")

artist1 = Artist.new({'name' => "Brand New"})
artist1.save()
artist2 = Artist.new({'name' => "Thrice"})
artist2.save()
artist3 = Artist.new({'name' => "Of Monsters And Men"})
artist3.save()
