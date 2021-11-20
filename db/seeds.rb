# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Manager
user1 = User.create!(:username=>"admin", :password_digest=> BCrypt::Password.create("password"))
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
user2 = User.create!(:username=>"yee1", :password_digest=>BCrypt::Password.create("password"))
user2.save
yee1 = Employee.new(:name=>"Thanadon Watcharawilairat")
yee1.user = user2
yee1.department = pluck
yee1.save

user3 = User.create!(:username=>"yee2", :password_digest=>BCrypt::Password.create("password"))
user3.save
yee2 = Employee.new(:name=>"Purin Petch-in")
yee2.user = user3
yee2.department = pluck
yee2.save

user4 = User.create!(:username=>"yee3", :password_digest=>BCrypt::Password.create("password"))
user4.save
yee3 = Employee.new(:name=>"Phasit Sangklub")
yee3.user = user4
yee3.department = pluck
yee3.save

# Create Shift
ka1 = Shift.new(:date=>"20-11-2021", :check_in=>"20-11-2021 00:00 +7", :check_out=>"20-11-2021 8:00 +7", :overtime=>1)
ka1.department = pluck
ka1.save

ka2 = Shift.new(:date=>"20-11-2021", :check_in=>"20-11-2021 8:00 +7", :check_out=>"20-11-2021 16:00 +7", :overtime=>2)
ka2.department = pluck
ka2.save

ka3 = Shift.new(:date=>"20-11-2021", :check_in=>"20-11-2021 16:00 +7", :check_out=>"21-11-2021 00:00 +7", :overtime=>3)
ka3.department = pluck
ka3.save

wp1 = Workplan.new(:date=>ka1.date, :check_in=>ka1.check_in, :check_out=>ka1.check_out, :overtime=>1)
wp1.shift = ka1
wp1.employee = yee1
wp1.save

wa1 = Workactual.new(:date=>ka1.date)
wa1.shift = ka1
wa1.employee = yee1
wa1.save

wp2 = Workplan.new(:date=>ka2.date, :check_in=>ka2.check_in, :check_out=>ka2.check_out, :overtime=>2)
wp2.shift = ka2
wp2.employee = yee1
wp2.save

wa2 = Workactual.new(:date=>ka2.date)
wa2.shift = ka2
wa2.employee = yee1
wa2.save

wp3 = Workplan.new(:date=>ka2.date, :check_in=>ka2.check_in, :check_out=>ka2.check_out, :overtime=>2)
wp3.shift = ka2
wp3.employee = yee2
wp3.save

wa3 = Workactual.new(:date=>ka2.date)
wa3.shift = ka2
wa3.employee = yee2
wa3.save

wp4 = Workplan.new(:date=>ka3.date, :check_in=>ka3.check_in, :check_out=>ka3.check_out, :overtime=>3)
wp4.shift = ka3
wp4.employee = yee1
wp4.save

wa4 = Workactual.new(:date=>ka3.date)
wa4.shift = ka3
wa4.employee = yee1
wa4.save

wp5 = Workplan.new(:date=>ka3.date, :check_in=>ka3.check_in, :check_out=>ka3.check_out, :overtime=>3)
wp5.shift = ka3
wp5.employee = yee2
wp5.save

wa5 = Workactual.new(:date=>ka3.date)
wa5.shift = ka3
wa5.employee = yee2
wa5.save

wp6 = Workplan.new(:date=>ka3.date, :check_in=>ka3.check_in, :check_out=>ka3.check_out, :overtime=>3)
wp6.shift = ka3
wp6.employee = yee3
wp6.save

wa6 = Workactual.new(:date=>ka3.date)
wa6.shift = ka3
wa6.employee = yee3
wa6.save