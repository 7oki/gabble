# ユーザー
User.create!(name:  "admin_user",
             email: "100000a@ugs.kochi-tech.ac.jp",
             login_name: "100000a",
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

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }