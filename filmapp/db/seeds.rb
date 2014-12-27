# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


m = Movie.new(title: 'The Equalizer', description: 'What do you see when you look at me?', rating: 6, webpage: '', runtime: 120)
g1 = Genre.new(name: 'Action')
g2 = Genre.new(name: 'Crime')
g1.save!
g2.save!
m.save!
m.genres << g1
m.genres << g2
m.save!