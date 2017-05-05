# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# t.string   "name"
# t.string   "image"
# t.integer  "status"
# t.text     "description"
# t.date     "start_date"
# t.date     "end_date"

names = ['Ruby on Rails', 'Java Spring', 'Nodejs']
data = [
    {
        name: 'Ruby on Rails',
        image: '',
        status: Course::ON_GOING_STATUS,
        description: '',
        start_date: Time.now,
        end_date: Time.now + 50 * 24 * 3600
    },
    {
        name: 'Java Spring',
        image: '',
        status: Course::COMING_STATUS,
        description: '',
        start_date: Time.now,
        end_date: Time.now + 50 * 24 * 3600
    },
    {
        name: 'Nodejs',
        image: '',
        status: Course::PASSED_STATUS,
        description: '',
        start_date: Time.now,
        end_date: Time.now + 50 * 24 * 3600
    },
    {
        name: 'PHP',
        image: '',
        status: Course::PASSED_STATUS,
        description: '',
        start_date: Time.now,
        end_date: Time.now + 50 * 24 * 3600
    },
    {
        name: 'VUEJS',
        image: '',
        status: Course::PASSED_STATUS,
        description: '',
        start_date: Time.now,
        end_date: Time.now + 50 * 24 * 3600
    }
]

data.each do |_data|
  Course.create(_data)
end