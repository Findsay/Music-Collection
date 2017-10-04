require('pg')

require_relative '../db/sql_runner'
require_relative 'artist'



class Album

  attr_accessor :title, :genre


  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @artists_id = options['artists_id'].to_i()
    @title = options['title']
    @genre = options['genre']

  end

  def save()
    sql = "INSERT INTO albums
    (
      artists_id,
      title,
      genre
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id;"
    values = [@artists_id, @title, @genre]
    @id = SqlRunner.run(sql, "save", values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run(sql, "delete_all_albums", values)
  end

  def self.list_all()
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run(sql, "list_all", values)
    return results.map { |album| Album.new(album) }
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artists_id]
    results = SqlRunner.run(sql, "get_arist", values)
    return results.map { |artist| Artist.new(artist) }
  end

  def update_album()
    sql = "UPDATE albums SET (artists_id, title, genre) = ($1, $2, $3)
    WHERE id = $4"
    values = [@artists_id, @title, @genre, @id]
    SqlRunner.run(sql, "update_album", values)
  end

  def delete_album()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, "delete_album", values)
  end


end
