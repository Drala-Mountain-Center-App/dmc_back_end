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

@video1 = Video.create!(
  vimeo_id: 844630998,
  title: 'Learn to Meditate Part 1',
  speaker: 'Daniel Hessey', 
  topic: 'Meditation Instruction',
  length: '00:07:18',
  date_recorded: '2017-18-23',
  video_url: 'https://vimeo.com/844630998?share=copy',
  thumbnail_url: 'https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F1696856869-4797362b715fc28425b1b8c2b1baf5f1aa9db39ef3bd3567572574c18d05c9d0-d_640x360&src1=http%3A%2F%2Ff.vimeocdn.com%2Fp%2Fimages%2Fcrawler_play.png',
  embed_code: '<iframe src="https://player.vimeo.com/video/844630998?h=d3a096a900" width="640" height="564" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>'
)
@video2 = Video.create!(
  vimeo_id: 844631799,
  title: 'Learn to Meditate Part 2',
  speaker: 'Daniel Hessey',
  topic: 'Meditation Instruction',
  length: '00:08:20',
  date_recorded: '2017-18-23',
  video_url: 'https://vimeo.com/844631799?share=copy',
  thumbnail_url: 'https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F1696834725-5ae807df9690d5c9d852add5243e303653f4845bead0f63540a10796e98131da-d_640x360&src1=http%3A%2F%2Ff.vimeocdn.com%2Fp%2Fimages%2Fcrawler_play.png',
  embed_code: '<iframe src="https://player.vimeo.com/video/844631799?h=8a3b584b93" width="640" height="564" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>'
)