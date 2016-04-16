# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bootcamp.create(name:"Fullstack Academy", address:"5 Hanover Square Floor 25 New York, NY 10004", website:"http://www.fullstackacademy.com/", email:"hello@fullstackacademy.com", number:"(123)456-7890", lat:40.704614 , lng:-74.0107207,description:"Become a software engineer. Fullstack Academy is an innovative software development school with campuses in NYC and Chicago.")
Bootcamp.create(name:"Dev Bootcamp",address:"351 West Hubbard Street Suite 701 Chicago, IL 60654",website:"http://devbootcamp.com/locations/chicago/",email:"hello@devbootcamp.com", number:"(877)431-9044", lat: 41.8896848, lng: -87.6399389,description:"Dev Bootcamp pioneered the short-term immersive “web development bootcamp,” a model that transforms beginners into full-stack web developers. Through effort, community support and training, we help beginners with little or no technical background reach a level of proficiency that allows them to get paid to continue learning on the job as junior web developers.")
Bootcamp.create(name:"Ironhack",address: "120 SW 8th St, Miami, FL 33130", website:"https://www.ironhack.com/en",email:"mia@ironhack.com", number:"(305)907-7086", lat: 25.766033, lng: -80.1983797, description:"Ironhack is the leading international coding bootcamp. Accelerate your career in 8 weeks and join the next generation of digital builders.")
Bootcamp.create(name:"Hack Reactor",address: "944 Market St, San Francisco, CA 94102", website:"http://www.hackreactor.com/",email:"admissions@hackreactor.com", number:"(415)547-0254", lat: 37.7836845, lng: -122.4112196, description:"Hack Reactor is unlike your typical programming or development bootcamp. With a 99% hiring rate and $105k average starting salaries, our results are unmatched.")
Bootcamp.create(name:"General Assembly",address: "1933 South Broadway, 11th Floor, Los Angeles, CA 90007",website:"https://generalassemb.ly/los-angeles", email:"la@generalassemb.ly", number:"(424)268-2803", lat: 34.0219473, lng: -118.45096, description:"General Assembly transforms thinkers into creators through education and opportunities in technology, business, and design.")
Bootcamp.create(name:"MakerSquare",address: "701 Brazos St, Austin, TX 78701", website:"http://www.makersquare.com/", email:"admissions@makersquare.com", number:"(512)212-4249", lat: 30.2688755, lng: -97.7427528, description:"MakerSquare is a three-month full-time career accelerator for software engineering. By teaching computer science fundamentals and modern web languages like JavaScript, we prepare students to join top flight engineering teams.")

bootcamp1 = Bootcamp.find_by(name: "Fullstack Academy")
bootcamp1.avatar = Rails.root.join("app/assets/images/fullstack_academy_logo.png").open
bootcamp1.save!

bootcamp2 = Bootcamp.find_by(name: "Dev Bootcamp")
bootcamp2.avatar = Rails.root.join("app/assets/images/dev_bootcamp_logo.png").open
bootcamp2.save!

bootcamp3 = Bootcamp.find_by(name: "Ironhack")
bootcamp3.avatar = Rails.root.join("app/assets/images/ironhack_logo.png").open
bootcamp3.save!

bootcamp4 = Bootcamp.find_by(name: "Hack Reactor")
bootcamp4.avatar = Rails.root.join("app/assets/images/hack_reactor_logo.png").open
bootcamp4.save!

bootcamp5 = Bootcamp.find_by(name: "General Assembly")
bootcamp5.avatar = Rails.root.join("app/assets/images/general_assembly_logo.png").open
bootcamp5.save!

bootcamp6 = Bootcamp.find_by(name: "MakerSquare")
bootcamp6.avatar = Rails.root.join("app/assets/images/makersquare_logo.png").open
bootcamp6.save!