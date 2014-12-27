# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


m = Movie.new(title: 'Gone Girl', description: "With his wife's disappearance having
 become the focus of an intense media circus, a man sees the spotlight turned on him when
 it's suspected that he may not be innocent.", rating: 8, webpage: 'http://www.gonegirlmovie.com/', runtime: 145)
 
g1 = Genre.new(name: 'Drama')
g2 = Genre.new(name: 'Thriller')
g1.save!
g2.save!
m.save!
m.genres << g1
m.genres << g2
m.save!

actors = []
actors << Actor.new(name: 'Ben Affleck')
actors << Actor.new(name: 'Tyler Perry')
actors << Actor.new(name: 'Rosamund Pike')
actors << Actor.new(name: 'Neil Patrick Harris')
actors << Actor.new(name: 'Missi Pyle')
actors << Actor.new(name: 'Patrick Fugit')

actors.each { |actor| actor.save! }

Cast.new(movie: m, actor: actors[0], character: 'Nick Dunne').save!
Cast.new(movie: m, actor: actors[1], character: 'Amy Dunne').save!
Cast.new(movie: m, actor: actors[2], character: 'Tanner Bolt').save!
Cast.new(movie: m, actor: actors[3], character: 'Desi Collins').save!
Cast.new(movie: m, actor: actors[4], character: 'Ellen Abbott').save!
Cast.new(movie: m, actor: actors[5], character: 'Detective Jim Gulpin').save!
