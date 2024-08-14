class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist&.name
  end

  def note_contents
    notes.map(&:content)
  end

  def note_contents=(notes)
    notes.each do |note|
      newNote = Note.find_or_create_by({content: note})
      self.notes << newNote
    end
  end
end
