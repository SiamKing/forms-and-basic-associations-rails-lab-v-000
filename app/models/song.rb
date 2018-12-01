class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? artist.name : nil
  end

  def note_contents=(contents)
    contents.each {|content| self.notes << Note.find_or_create_by(content: content) if content != ''}
  end

  def note_contents
    self.notes.map(&:content)
  end

end
