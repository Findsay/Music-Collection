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
  'title' => "Science Fiction",
  'genre' => "Alt Rock"

  })

  album1.save()

  album2 = Album.new({
    'artists_id' => artist1.id,
    'title' => "Daisy",
    'genre' => "Alt Rock"

    })

    album2.save()

    album3 = Album.new({
      'artists_id' => artist2.id,
      'title' => "Vheissu",
      'genre' => "Alt Rock"

      })

      album3.save()

      album4 = Album.new({
        'artists_id' => artist3.id,
        'title' => "Beneath the Skin",
        'genre' => "Folk Rock"

        })

        album4.save()




  # album1.title = "Change album name"
  # album1.update_album()

# artist3.name = "A new name"
# artist3.update_artist()

# artist3.delete_artist()



  binding.pry
  nil
