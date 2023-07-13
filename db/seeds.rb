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

Video.create!(title: 'Learn to Meditate Part 1', speaker: 'Daniel Hessey', topic: 'Meditation Instruction', length: '07:18', date_recorded: '2017-18-23', video_url: 'https://vimeo.com/844630998?share=copy', embed_code: '<iframe src="https://player.vimeo.com/video/844630998?h=d3a096a900" width="640" height="564" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>')
Video.create!(title: 'Learn to Meditate Part 2', speaker: 'Daniel Hessey', topic: 'Meditation Instruction', length: '08:20', date_recorded: '2017-18-23', video_url: 'https://vimeo.com/844631799?share=copy', embed_code: '<iframe src="https://player.vimeo.com/video/844631799?h=8a3b584b93" width="640" height="564" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>')