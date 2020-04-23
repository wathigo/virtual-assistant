# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = [
    {
        name: 'Secretarial',
        description: 'We offer secretarial services such as data entry and customer support. We have a team made up of proffessionals with skills needed to complete most of your needs.'
    },
    {
        name: 'Writing',
        description: 'We offer writing services that includes writing articles, reseach, etc'
    },
    {
        name: 'Web development',
        description: 'We also have web developers as part of our team. Web services includes, front web development, backend development.'
    } 
]

categories.each do |cat|
    Category.create!(name: cat[:name], description: cat[:description])
end