# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

WebiniusCms::Language.destroy_all

WebiniusCms::Language.create(name: 'English', code: 'en', status: true, default: true)

WebiniusCms::User.destroy_all

WebiniusCms::User.create(username: 'admin', name: 'admin', password: 'admin', password_confirmation: 'admin')