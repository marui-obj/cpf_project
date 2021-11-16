# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Manager
user1 = User.create!(:username=>"admin", :password_digest=> BCrypt::Password.create("my password"))
boss = Manager.new(:name=>"Thanakorn Boriboon")
boss.user = user1
boss.save

# Create Department
pluck = Department.new(:title=>"งานถอนขนไก่")
pluck.manager = boss
pluck.save

kill = Department.new(:title=>"งานเชือดไก่")
kill.manager = boss
kill.save

qc = Department.new(:title=>"งานไก่ตกราว")
qc.manager = boss
qc.save

store = Department.new(:title=>"งานจัดเก็บและจ่ายสินค้าแช่แข็ง")
store.manager = boss
store.save

#Create Employee
user2 = User.create!(:username=>"yee1", :password_digest=>BCrypt::Password.create("my password"))
user2.save
yee1 = Employee.new(:name=>"Thanadon Watcharawilairat")
yee1.user = user2
yee1.department = pluck
yee1.save

user3 = User.create!(:username=>"yee2", :password_digest=>BCrypt::Password.create("my password"))
user3.save
yee2 = Employee.new(:name=>"Purin Petch-in")
yee2.user = user3
yee2.department = pluck
yee2.save

user4 = User.create!(:username=>"yee3", :password_digest=>BCrypt::Password.create("my password"))
user4.save
yee3 = Employee.new(:name=>"Phasit Sangklub")
yee3.user = user4
yee3.department = pluck
yee3.save

# Create Shift
ka1 = Shift.new(:check_in=>"15-11-2021 00:00", :check_out=>"15-11-2021 8:00", :overtime=>1)
ka1.department = pluck
ka1.employees = [yee1]
ka1.save

ka2 = Shift.new(:check_in=>"15-11-2021 8:00", :check_out=>"15-11-2021 16:00", :overtime=>2)
ka2.department = pluck
ka2.employees = [yee1, yee2]
ka2.save

ka3 = Shift.new(:check_in=>"15-11-2021 16:00", :check_out=>"16-11-2021 00:00", :overtime=>3)
ka3.department = pluck
ka3.employees = [yee1, yee2, yee3]
ka3.save