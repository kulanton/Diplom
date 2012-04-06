u=User.new(:login=>"admin", :password=>"qwerty", :password_confirmation=>"qwerty", :email=>"admin@mail.msiu.ru")
u.save
u.role = 1
u.state = "active"
u.save
