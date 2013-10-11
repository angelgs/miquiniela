# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 user = User.create(name: 'Angel Gutiérrez', email: 'agutierrs@gmail.com', password:'secreto', password_confirmation: 'secreto')
 season = Season.create(name:'Torneo Apertura 2013', start_at: Date.today, end_at: Date.today + 300)


 schedule = Schedule.create(season: season, name: 'Jornada 1', start_at: season.start_at, end_at: season.start_at + 3)

 Stadium.create(name: 'La Corregidora')
 Stadium.create(name: 'Caliente')
 Stadium.create(name: 'Azul')
 Stadium.create(name: 'Nou Camp')
 Stadium.create(name: 'Cuauhtémoc')
 Stadium.create(name: 'Nemesio Díez')
 Stadium.create(name: 'Luis Pirata Fuente')
 Stadium.create(name: 'Morelos')
 Stadium.create(name: 'Corona TSM')
 Stadium.create(name: 'Tecnológico')
 Stadium.create(name: 'Hidalgo')
 Stadium.create(name: 'Andrés Quintana Roo')
 Stadium.create(name: 'Víctor M. Reyna')
 Stadium.create(name: 'Jalisco')
 Stadium.create(name: 'Olímpico Universitario')
 Stadium.create(name: 'Omnilife')
 Stadium.create(name: 'Azteca')
 Stadium.create(name: 'Universitario')


 Team.create(name:'Gallos Blancos')
 Team.create(name:'Monarcas Morelia')
 Team.create(name:'Tiburones Rojos de Veracruz')
 Team.create(name:'Jaguares de Chiapas')
 Team.create(name:'Tijuana')
 Team.create(name:'Atlas')
 Team.create(name:'Cruz Azul')
 Team.create(name:'Rayados de Monterrey')
 Team.create(name:'León')
 Team.create(name:'Atlante')
 Team.create(name:'Puebla')
 Team.create(name:'Universidad Nacional')
 Team.create(name:'Toluca')
 Team.create(name:'Pachuca')
 Team.create(name:'Tigres UANL')
 Team.create(name:'América')
 Team.create(name:'Guadalajara')
 Team.create(name:'Santos Laguna')

