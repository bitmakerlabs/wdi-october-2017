class Film
  attr_accessor :id, :title, :country, :genre, :rating, :description

  @@library = []
  @@id = 1;

  def initialize(options)
    @title = options[:title]
    @country = options[:country]
    @genre = options[:genre]
    @rating = options[:rating]
    @description = options[:description]
    @id = @@id

    @@id += 1
  end

  def self.create(options)
    film = self.new(options)
    @@library << film
    return film
  end

  def self.all
    return @@library
  end

end
