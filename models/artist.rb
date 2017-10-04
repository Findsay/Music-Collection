require('pg')

require_relative '../db/sql_runner'


class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id;"
    values = [@name]
    @id = SqlRunner.run(sql, "save", values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    values = []
    SqlRunner.run(sql, "delete_all_artists", values)
  end

  def self.list_all()
    sql = "SELECT * FROM artists"
    values = []
    results = SqlRunner.run(sql, "list_all", values)
    return results.map { |artist| Artist.new(artist) }
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artists_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, "albums", values)
    return results.map { |album| Album.new(album) }
  end

  def update_artist()
    sql = "UPDATE artists SET (name) = ($1)
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, "update_artist", values)
  end


end
