# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Manager
user1 = User.create!(:username=>"admin", :password_digest=>"password")
boss = Manager.new(:name=>"admin")
boss.user = user1
boss.save

# Create Department
pluck = Department.new(:title=>"Plucking")
pluck.manager = boss
pluck.save

# Create Employee
user2 = User.create!(:username=>"yee1" :password_digest=>"yee1")
user2.save
yee1 = Employee.new(:name=>"yee1")
yee1.user = user2
yee1.department = pluck
yee1.save

user3 = User.create!(:username=>"yee2" :password_digest=>"yee2")
user3.save
yee2 = Employee.new(:name=>"yee2")
yee2.user = user3
yee2.department = pluck
yee2.save

user4 = User.create!(:username=>"yee3" :password_digest=>"yee3")
user4.save
yee3 = Employee.new(:name=>"yee3")
yee3.user = user4
yee3.department = pluck
yee3.save

# Create Shift
ka1 = Shift.new(:check_in=>"15-11-2021 00:00", :check_out=>"15-11-2021 8:00")
ka1.department = pluck
ka1.employees = [yee1]
ka1.save

ka2 = Shift.new(:check_in=>"15-11-2021 8:00", :check_out=>"15-11-2021 16:00")
ka2.department = pluck
ka2.employees = [yee1, yee2]
ka2.save

ka3 = Shift.new(:check_in=>"15-11-2021 16:00", :check_out=>"16-11-2021 00:00")
ka3.department = pluck
ka3.employees = [yee1, yee2, yee3]
ka3.save