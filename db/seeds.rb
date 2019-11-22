User.create(user_name: "test_user1", password: "password")
# Accountの作成はユーザー認証してください
# 坊主（アカウント名）をフォローする
Autofollow.create(keyword: "いじめ保険というのが出来たらしいので、",account_id: 1)
# Autounfollowは自分のフォロワーからプロフィール画像を設定していない人を削除する。
Autolike.create(keyword: "サンタコス", account_id: 1)
Autopost.create(autopost_caption: "予約投稿できたウホ！", image1:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRz0PjHxSu8o22rmStbuLcQUxACe7Qq-cFMh3HAuB_jpcDg2NHc",autopost_date: `date +"20 %k %d %m *"`.chomp, account_id: 1)
Autopost.create(autopost_caption: "予約投稿できたウホ！", image1:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRz0PjHxSu8o22rmStbuLcQUxACe7Qq-cFMh3HAuB_jpcDg2NHc",autopost_date: `date +"30 %k %d %m *"`.chomp, account_id: 1)
Autopost.create(autopost_caption: "予約投稿できたウホ！", image1:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRz0PjHxSu8o22rmStbuLcQUxACe7Qq-cFMh3HAuB_jpcDg2NHc",autopost_date: `date +"10 %k %d %m *"`.chomp, account_id: 1)
Autopost.create(autopost_caption: "予約投稿できたウホ！", image1:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRz0PjHxSu8o22rmStbuLcQUxACe7Qq-cFMh3HAuB_jpcDg2NHc",autopost_date: `date +"40 %k %d %m *"`.chomp, account_id: 1)
Autopost.create(autopost_caption: "予約投稿できたウホ！", image1:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRz0PjHxSu8o22rmStbuLcQUxACe7Qq-cFMh3HAuB_jpcDg2NHc",autopost_date: `date +"50 %k %d %m *"`.chomp, account_id: 1)
Autopost.create(autopost_caption: "予約投稿できたウホ！", image1:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRz0PjHxSu8o22rmStbuLcQUxACe7Qq-cFMh3HAuB_jpcDg2NHc",autopost_date: `date +"00 %k %d %m *"`.chomp, account_id: 1)