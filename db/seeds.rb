#coding: utf-8

User.create!(name:  "管理者アカウント",
             email: "100000a@ugs.kochi-tech.ac.jp",
             login_name: "100000a",
             password:              "foobar",
             password_confirmation: "foobar",
             profile: "管理者ユーザーです",
             admin: true)

User.create!(name:  "KUTPG",
             email: "500000a@kochi-tech.ac.jp",
             login_name: "500000a",
             password:              "foobar",
             password_confirmation: "foobar",
             profile: "プログラミングサークル「KUTPG」のアカウントです", 
             official: true)
             
User.create!(name:  "男子バレーボール部",
             email: "500001a@kochi-tech.ac.jp",
             login_name: "500001a",
             password:              "foobar",
             password_confirmation: "foobar",
             profile: "男子バレー部のアカウントです。大会日程や結果などをお知らせします！", 
             official: true)
             
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
Micropost.create(user_id: 1, content: "はじめまして。管理者アカウントです！")
Micropost.create(user_id: 1, content: "管理者アカウントでは、皆さんからの申請を受け付けることができます！")
Micropost.create(user_id: 1, content: "申請はヘッダーの申請から「全体通知申請」または「アカウント作成申請」を選択して行ってください。")
Micropost.create(user_id: 2, content: "本日の午後7時から，AtCoderバーチャルコンテストを行います．興味のある方はA-WSにお越しください")
Micropost.create(user_id: 3, content: "先月行われた高知県リーグで全勝優勝し、7連覇しました！")
Micropost.create(user_id: 8, content: "パターン認識の講義は，回帰・分類・クラスタリングの違いを事前に理解した上で聞くと理解が深まるからオススメ")
Micropost.create(user_id: 4, content: "脳情報学期末は2月7日に決定らしいです")
Micropost.create(user_id: 4, content: "詳しい説明は明日の講義で教えてくれるそうです")
Micropost.create(user_id: 9, content: "ソフトウェア工学の発表会は1/31(木)の3～5限にK101であります．情報学群3年生が現状の課題から新たなシステムを作りました．興味がある方は是非来てください！")
Micropost.create(user_id: 7, content: "情報2年生へ：実験3i・4Cのレポートの参考文献は実験室の書籍がおすすめです")
Micropost.create(user_id: 7, content: "データベースの講義のおかげで、ソフ工での開発がしやすかった")
Micropost.create(user_id: 9, content: "研究室紹介は2/12にC101であります")
Micropost.create(user_id: 5, content: "2/8まで平日は図書館が21:30まで開館してるので、テスト勉強に集中したい方は是非！")
Micropost.create(user_id: 1, content: "インフルエンザが流行しているので、予防と治療をしっかり行いましょう")
Micropost.create(user_id: 6, content: "パワースペクトルは周波数ごとのパワーをグラフ化したもの、振幅スペクトルは周波数ごとの振幅をグラフ化したもの")
Micropost.create(user_id: 8, content: "DB第13回演習問題11(2)の答えはこれであってる？ SELECT 学生_typ.学生番号, 学生_typ.氏名, FROM 学生 WHERE 出身_typ.都道府県 = N'高知県'")
Micropost.create(user_id: 4, content: "過去問が欲しい方はメッセージで相談してください")
Micropost.create(user_id: 6, content: "画像処理の勉強におすすめなのは「ディジタル画像処理 」")
Micropost.create(user_id: 10, content: "Ruby on Railsまとめ：<% ～ %>は、この文中の記述は文字列として返されず計算などの処理として認識され、<%= ～ %>は、実行された結果を文字列として出力")
Micropost.create(user_id: 6, content: "")
Micropost.create(user_id: 8, content: "")
Micropost.create(user_id: 7, content: "")
Micropost.create(user_id: 9, content: "")
Micropost.create(user_id: 10, content: "情報科学3の教科書だれか譲ってくれませんか？")
Micropost.create(user_id: 10, content: "数学の教科書が欲しい方は連絡してください")
Micropost.create(user_id: 1, content: "不適切な投稿をしたアカウントには管理者から警告またはアカウント削除というペナルティを受けます。投稿を行う前に一度読み直してから投稿を行うように心がけましょう！")

=begin
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
=end

# リレーションシップ
users = User.all
user  = users.first
following = users[1..100]
followers = users[1..100]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


# 全体通知申請

Notice.create(content: "サンプル",
              reason: "sample",
              created_at: 2.years.ago )
              
#アカウント作成申請