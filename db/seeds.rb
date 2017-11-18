# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sources = Source.create([{ name: 'lenta.ru', login: '', password: '', api_url: 'https://lenta.ru/rss' , description_url: '.b-text', image_url: ''},
                        { name: 'meduza.io', login: '', password: '', api_url: 'https://meduza.io/rss/all' , description_url: '.Body', image_url: '' },
                        { name: 'korrespondent.net', login: '', password: '', api_url: 'http://k.img.com.ua/rss/ru/all_news2.0.xml' , description_url: '.post-item__text', image_url: '' },
                        { name: 'news.liga.net', login: '', password: '', api_url: 'http://news.liga.net/all/rss.xml' , description_url: '._ga1_on_', image_url: '' },
                        { name: 'computerworld.ru', login: '', password: '', api_url: 'https://www.computerworld.ru/rss' , description_url: '.article-full article p', image_url: '' },
                        { name: '3dnews.ru', login: '', password: '', api_url: 'https://3dnews.ru/news/rss/' , description_url: '.js-mediator-article', image_url: '' }])
