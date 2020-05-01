require 'sqlite3'


DB = {:conn => SQLite3::Database.new("db/songs.db")}  #Creating the Database
DB[:conn].execute("DROP TABLE IF EXISTS songs")       #Droping songs to avoid an error if it already exists

sql = <<-SQL                                          #Creating the songs table
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album TEXT
  )
SQL

DB[:conn].execute(sql)
DB[:conn].results_as_hash = true
