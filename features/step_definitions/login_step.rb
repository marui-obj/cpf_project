Given('the field {string} is empty') do |string|
    fill_in(string, :with => '')
end

Given('I have users:') do |table|
    table.rows_hash.drop(1).each do |username, password|
        @current_user = FactoryBot.create(:user, username: username, password: password)
        puts "#{@current_user.inspect}:#"
        puts "#{User.all.inspect}:#"
        # @user.destroy unless @user.nil?
    end
end
