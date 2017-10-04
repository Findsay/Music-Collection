require('pg')

require_relative '../db/sql_runner'


class Album

  def initialize(options)
    @id = options['id'].to_i()
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


end
