class Owner
  # code goes here

  attr_reader :name, :species

  @@all = []

  def self.all
  	@@all
  end

  def self.count
  	self.all.length
  end

  def self.reset_all
  	self.all.clear
  end

  def initialize(name)
  	@name = name
  	@species = "human"
  	@@all << self
  end

  def say_species
  	"I am a #{@species}."
  end

  def dogs
  	Dog.all.select{|dog| dog.owner == self}
  end

  def cats
  	Cat.all.select{|cat| cat.owner == self}
  end

  def buy_cat(name)
  	Cat.new(name, self)
  end

  def buy_dog(name)
  	Dog.new(name, self)
  end

  def walk_dogs
  	Dog.all.select{|dog| dog.owner == self}.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
  	Cat.all.select{|cat| cat.owner == self}.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
  	all_pets = Cat.all + Dog.all

  	all_pets.select{|pet| pet.owner == self}.each{|pet| pet.owner, pet.mood = nil, "nervous"}
  end

  def list_pets

  	"I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end