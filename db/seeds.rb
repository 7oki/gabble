User.create!(name:  "admin_user",
             email: "999999z@ugs.kochi-tech.ac.jp",
             login_name: "999999z",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = "#{n+100001}a"
  email = "#{n+100001}a@ugs.kochi-tech.ac.jp"
  login_name = email.split("@")[0]
  password = "password"
  User.create!(name:  name,
               email: email,
               login_name: login_name,
               password:              password,
               password_confirmation: password)
end