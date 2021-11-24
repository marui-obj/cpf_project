
user1 = User.create!(:username=>"manager1", :password_digest=> BCrypt::Password.create("password"))
boss1 = Manager.new(:name=>"Thanakorn Boriboon")
boss1.user = user1
boss1.save

user5 = User.create!(:username=>"manager2", :password_digest=> BCrypt::Password.create("password"))
boss2 = Manager.new(:name=>"Nawin Aeimsamaung")
boss2.user = user5
boss2.save

# Create Department
pluck = Department.new(:title=>"งานถอนขนไก่")
pluck.manager = boss1
pluck.save

kill = Department.new(:title=>"งานเชือดไก่")
kill.manager = boss1
kill.save

qc = Department.new(:title=>"งานไก่ตกราว")
qc.manager = boss2
qc.save

store = Department.new(:title=>"งานจัดเก็บและจ่ายสินค้าแช่แข็ง")
store.manager = boss2
store.save

pluck_employee = ["Thanadon Watcharawilairat","Purin Petch-in","Phasit Sangklub"]
kill_employee = ["Thatphum Paonim","Panat Raktukkun","Pakpoom Punpoon"]
qc_employee = ["James Smith","David Johnson","Robert Williams","William Johnson"]
store_employee = ["Michael Brown","James Jones","Robert Brown","Maria Martinez","Robert Miller"]

employee_amount = pluck_employee.length() + kill_employee.length() + qc_employee.length() + store_employee.length()

department_list = { :work1 => [pluck,pluck_employee.length()],
                    :work2 => [kill,pluck_employee.length() + kill_employee.length()],
                    :work3 => [qc,pluck_employee.length() + kill_employee.length() + qc_employee.length()],
                    :work4 => [store,employee_amount]}

yee_list = []
ka_list = []



[:work1,:work2,:work3,:work4].each do |work|
    (30).downto(25) do |j| 
        
        for ka_time in 0...3
            if (ka_time == 3)
                ka = Shift.new(:date=>"#{j}-11-2021", :check_in=>"#{j}-11-2021 #{ka_time*8}:00 +7", :check_out=>"#{j+1}-11-2021 0:00 +7", :overtime=>ka_time)
            else
                ka = Shift.new(:date=>"#{j}-11-2021", :check_in=>"#{j}-11-2021 #{ka_time*8}:00 +7", :check_out=>"#{j}-11-2021 #{ka_time*8+8}:00 +7", :overtime=>ka_time)
            end
            ka.department = department_list[work][0]
            ka_list.append(ka)
            ka.save
        end
        
    end 
    
end

for i in 0...employee_amount
    user = User.create!(:username=>"employee#{i+1}", :password_digest=>BCrypt::Password.create("password"))
    user.save
    

    if (i < department_list[:work1][1])
        yee = Employee.new(:name=>pluck_employee[i])
        yee.user = user
        yee.department = department_list[:work1][0]

        
    elsif(i < department_list[:work2][1])
        yee = Employee.new(:name=>kill_employee[i - department_list[:work1][1]])
        yee.user = user
        yee.department = department_list[:work2][0]
    
    elsif(i < department_list[:work3][1])
        yee = Employee.new(:name=>qc_employee[i - department_list[:work2][1]])
        yee.user = user
        yee.department = department_list[:work3][0]
    
    else
        yee = Employee.new(:name=>store_employee[i - department_list[:work3][1]])
        yee.user = user
        yee.department = department_list[:work4][0]
    end

    yee_list.append(yee)
    yee.save
    
end
