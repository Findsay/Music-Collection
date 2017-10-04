require('pg')

require_relative '../db/sql_runner'


class Artist

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i()
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
    sql = "DELETE FROM artists"
    values = []
    SqlRunner.run(sql, "delete_all_artists", values)
  end

  def self.list_all()
    sql = "SELECT * FROM artists"
    values = []
    results = SqlRunner.run(sql, "list_all", values)
    return results.map { |artist| Artist.new(artist) }
  end


end
