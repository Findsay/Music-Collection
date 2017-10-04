require("pry")
require_relative("models/artist")
require_relative("models/album")


Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => "Brand New"})
artist1.save()

artist2 = Artist.new({'name' => "Thrice"})
artist2.save()

artist3 = Artist.new({'name' => "Of Monsters And Men"})
artist3.save()

album1 = Album.new({
  'artists_id' => artist1.id,
  'title' => "The Devil and God",
  'genre' => "A"

  })
album1.save()

album2 = Album.new({
  'artists_id' => artist1.id,
  'title' => "Science Fiction",
  'genre' => "A"

  })
album2.save()
