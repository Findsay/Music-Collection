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
  'title' => "The Devil and God are Raging Inside Me",
  'genre' => "A"

  })
album1.save()

album2 = Album.new({
  'artists_id' => artist1.id,
  'title' => "Science Fiction",
  'genre' => "A"

  })
album2.save()

album3 = Album.new({
  'artists_id' => artist2.id,
  'title' => "Beggars",
  'genre' => "A"

  })
album3.save()

album4 = Album.new({
  'artists_id' => artist3.id,
  'title' => "Beneath The Skin",
  'genre' => "A"

  })
album4.save()

binding.pry
nil
