# post = ["この投稿はスパルタキャンプ in hachimantai Ruby on Rails用のサンプルアプリです", "年齢不問、経験不問、職歴不問。プログラミングを学びたいという”強い思い”を持っている人が対象のプログラミング学習イベントです。", "スパルタキャンプでは、本や教科書で学ぶのとは異なり分からないことがあったらすぐに質問することができる環境で進めていくことができるので、挫折することがありません。"]

Category.create(title: '雫石')
Category.create(title: '西山')
Category.create(title: '御所')
Category.create(title: '御明神')

Author.create(name: "平澤剛", description: "雫石地区在住", image_url: "http://heaaart.com/heartadmin/wp-content/uploads/2016/07/168243-2.png", email: "test@gmail.com", password: "password")


# 30.times do |index|
#   Post.create(title: "#{index}回目", body: "#{index}回目の投稿です。#{post.sample}", category_id: rand(3) + 1 )
# end
