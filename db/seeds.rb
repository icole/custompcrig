# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach("./db/parts_list.csv") do |row|
    Part.create({
      id: row[0],
      type_name: row[1],
      manufacturer: row[2],
      model: row[3],
      details: row[4] || "",
      link: row[5],
      amzprice: row[6].to_f,
      incompatibleparts: row[7],
      amzdesc: row[8]
    })
end
