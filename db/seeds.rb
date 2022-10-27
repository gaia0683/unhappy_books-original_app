# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  name: '阿藤元矢',
  nickname: 'ぷーちゃん',
  email: 'pu_chan_pig@gmail.com',
  password: 'pu_chan31',
  password_confirmation: 'pu_chan31'
)
User.create(
  name: '中野あゆみ',
  nickname: 'たこ焼きハム子',
  email: 'noah_hamu@icloud.com',
  password: 'noahnoah33',
  password_confirmation: 'noahnoah33'
)
User.create(
  name: '大塚昂士',
  nickname: 'バク',
  email: 'nightmare@gmail.com',
  password: 'takashio99',
  password_confirmation: 'takashio99'
)
User.create(
  name: 'ヤング愛美',
  nickname: 'アメリカン',
  email: 'latte_love@icloud.com',
  password: 'yang_love96',
  password: 'yang_love96'
)
User.create(
  name: '倉持祐介',
  nickname: 'イケメン',
  email: 'handsome_cool@gmail.com',
  password: 'pokepoke97',
  password: 'pokepoke97'
)
Book.create(
  title: "リング",
  image: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0012/9784041880012.jpg?_ex=200x200",
  author: "鈴木　光司",
  publisher_name: "KADOKAWA",
  url: "https://books.rakuten.co.jp/rb/590223/",
  isbn: 9784041880012
)
Book.create(
  title: "白夜行",
  image: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/4398/9784087474398.jpg?_ex=200x200",
  author: "東野圭吾",
  publisher_name: "集英社",
  url: "https://books.rakuten.co.jp/rb/1444068/",
  isbn: 9784087474398
)
Book.create(
  title: "睡魔",
  image: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3444/34440307.jpg?_ex=200x200",
  author: "梁石日",
  publisher_name: "幻冬舎",
  url: "https://books.rakuten.co.jp/rb/1510048/",
  isbn: 9784344403079
)
Book.create(
  title: "ダークゾーン　上（1）",
  image: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2470/9784041062470.jpg?_ex=200x200",
  author: "貴志　祐介",
  publisher_name: "KADOKAWA",
  url: "https://books.rakuten.co.jp/rb/15213664/",
  isbn: 9784041062470
)
Book.create(
  title: "ダークゾーン　下（2）",
  image: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2494/9784041062494.jpg?_ex=200x200",
  author: "貴志　祐介",
  publisher_name: "KADOKAWA",
  url: "https://books.rakuten.co.jp/rb/15213661/",
  isbn: 9784041062494
)
Review.create(
  title: '読了後の脱力感が圧巻です！'
  content: '主人公たちの生い立ちを追っていく中で様々な出来事があり、最後は、、、ぜひ自分の目でご覧ください！',
  user_id: 2,
  book_id: 2
)
Review.create(
  title: '映画の緊張感がそのまま本に！'
  content: '映像での恐怖がそのまま本でも伝わってきました！今日は眠れなさそうです、、、',
  user_id: 4,
  book_id: 1
)
Review.create(
  title: '主人公の人生が読む手を止まらせません！',
  content: 'ただの一般人だった主人公がある出来事をきっかけにどんどんのし上がっていきますがまた一つの事件がきっかけで主人公の出世街道も急展開を向かえます！',
  user_id: 5,
  book_id: 3
)
Review.create(
  title: 'ゲームの世界でおこる様々な出来事が面白いです！',
  content: '非常に興味津々な展開が読み手を飽きさせません！',
  user_id: 1,
  book_id: 4
)
Review.create(
  title: '上巻からのクライマックスがたまらない！',
  content: '上巻もなかなか興味津々な展開でしたが下巻で更に盛り上がり、最後には意外な事実が判明します！とても面白いです！',
  user_id: 3,
  book_id: 5
)
Rating.create(
  point: 5,
  review_id: 1,
  category_id: 3
)
Rating.create(
  point: 5,
  review_id: 2,
  category_id: 5
)
Rating.create(
  point: 5,
  review_id: 3,
  category_id: 4
)
Rating.create(
  point: 5,
  review_id: 4,
  category_id: 2
)
Rating.create(
  point: 5,
  review_id: 5,
  category_id: 1
)
Category.create(
  name: 1
)
Category.create(
  name: 2
)
Category.create(
  name: 3
)
Category.create(
  name: 4
)
Category.create(
  name: 5
)
