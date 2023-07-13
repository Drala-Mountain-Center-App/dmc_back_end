require 'rails_helper'

RSpec.describe Program do
  before :each do
    @teachers =  [
      {
      "teacher_name": "Brooke Binstock",
      "teacher_image": "https://www.dralamountain.org/wp-content/uploads/2017/01/Brooke-Binstock_Quiet-Mind_117b.jpg",
      "teacher_url": "https://www.dralamountain.org/teacher/brooke-binstock/"
      },
      {
      "teacher_name": "Marissa Knox",
      "teacher_image": "https://www.dralamountain.org/wp-content/uploads/2022/06/marissa-knox.jpg",
      "teacher_url": "https://www.dralamountain.org/teacher/18544-2/"
      },
      {
      "teacher_name": "Kelly Lindsey",
      "teacher_image": "https://www.dralamountain.org/wp-content/uploads/2021/05/Kelly-FC721-e1620334603593.jpeg",
      "teacher_url": "https://www.dralamountain.org/teacher/kelly-lindsey/"
      }
      ]

    @categories = [
      {
      "category_name": "Experiential Retreats",
      "category_url": "https://www.dralamountain.org/program-category/experiential-retreats/"
      },
      {
      "category_name": "Meditation &amp; Mindfulness",
      "category_url": "https://www.dralamountain.org/program-category/meditation-mindfulness-retreats/"
      },
      {
      "category_name": "On Land Retreats",
      "category_url": "https://www.dralamountain.org/program-category/land/"
      },
      {
      "category_name": "Yoga, Wellness &amp; Embodied Living",
      "category_url": "https://www.dralamountain.org/program-category/yoga-wellness-health-retreats/"
      }
      ]

    @data = {
      program_name: "Quiet Mind, Open Heart: Resting in Inner Refuge",
      program_start_date: "2023-07-23 00:00:00",
      program_end_date: "2023-07-28 00:00:00",
      program_content: "<p data-pm-slice=\"1 1 []\">Come home to yourself. Say YES to a spacious retreat designed to connect you with the inner resources of your body, heart, and mind. Our practice will focus on the inherent qualities of loving-kindness, compassion, joy, and peace, grounded in sacred wisdom traditions. The daily schedule will include guided meditation, yoga, bodywork, and time in nature, while being held in community. Throughout the retreat you will be invited to return to your inner refuge and rest deeply. You will leave this retreat feeling rested, resourced, and ready to move through the world with clarity and intention.</p>\r\n\r\n<h4><b>Schedule</b></h4>\r\n7:30 am – Breakfast\r\n9:00 am – Meditation, Contemplation, and Yoga\r\n12:30 pm – Lunch\r\n2:00 pm – Stupa Tour, Guided Hike, BodyWork Sessions, Rest\r\n6:30 pm – Dinner\r\n8:00 pm – Restorative Yoga, Yoga Nidra\r\n<h4><b>Bodywork</b></h4>\r\n<p data-pm-slice=\"1 1 []\">These offerings will be available for an additional fee. You may sign up during the retreat.</p>\r\n\r\n<h5><b>Therapeutic Massage and Body Wisdom Sessions with Brooke</b></h5>\r\n<ul>\r\n \t<li data-pm-slice=\"1 1 []\">60 minute therapeutic massage -$130</li>\r\n \t<li>90 minute therapeutic massage -$150</li>\r\n</ul>\r\nBody Wisdom Session-  The body and mind are intricately connected. In this 2 hour session, get to know yourself more deeply. Experience an array of body-centered modalities steeped in self-compassion. Carry these tools with you into your everyday life so that you may embody a greater state of calm. – $250\r\n\r\nPlease review <a href=\"https://www.dralamountain.org/about/policies/covid-19/\">our current COVID-19 policy </a>before visiting DMC.\r\n\r\n&nbsp;\r\n<h4>Presenters</h4>\r\n<p style=\"text-align: center;\"><span style=\"font-size: 13px; text-align: center;\">(from left) Brooke Binstock, Marissa Knox, Kelly Lindsey</span><img class=\"aligncenter wp-image-18549\" src=\"https://www.dralamountain.org/wp-content/uploads/2017/01/quietmindopenheart_presenters_unedited-590x393.jpg\" width=\"402\" height=\"268\" /></p>",
      program_image: "https://www.dralamountain.org/wp-content/uploads/2023/02/drala-mountain-open-heart-retreat.png",
      program_price: "Tuition $350 + 5 nights",
      program_url: "https://www.dralamountain.org/program/qm723-quiet-mind-open-heart-resting-in-inner-refuge/",
      registration_url: "https://www.dralamountain.org/program/qm723-quiet-mind-open-heart-resting-in-inner-refuge/?form=1",
      program_categories: @categories,
      program_teachers: @teachers
    }
  end
  it 'exists' do
    program = Program.new(@data)

    expect(program).to be_a(Program)
  end


  it 'has attributes' do
    program = Program.new(@data)
    
    expect(program.name).to eq(@data[:program_name])
    expect(program.start_date).to eq(@data[:program_start_date])
    expect(program.end_date).to eq(@data[:program_end_date])
    expect(program.content).to eq(@data[:program_content])
    expect(program.image).to eq(@data[:program_image])
    expect(program.price).to eq(@data[:program_price])
    expect(program.url).to eq(@data[:program_url])
    expect(program.registration_url).to eq(@data[:registration_url])
    expect(program.categories).to eq(@data[:program_categories])
    expect(program.teachers).to eq(@data[:program_teachers])
  end
end