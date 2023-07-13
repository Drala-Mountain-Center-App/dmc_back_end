# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Video.destroy_all

User.create!(first_name: 'Alejandro', last_name: 'last_name', email: 'email@email.email', member: true, password: 'password123')
User.create!(first_name: 'logan', last_name: 'logan', email: 'loganlogan@gmail.com', member: false, password: 'banana123')

Video.create!(title: 'Drive All Blames into One', speaker: 'Reid Miller', topic: 'Logon Slogans', length: '2:52', date_recorded: '2021-07-11', video_url: 'https://vimeo.com/844375159/1e438adafd', embed_code: '<iframe title="vimeo-player" src="https://player.vimeo.com/video/844375159?h=1e438adafd" width="640" height="360" frameborder="0"    allowfullscreen></iframe>')