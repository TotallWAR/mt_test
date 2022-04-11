# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

campaigns = PromoCampaign.create([{
                                    "name": "Promo campaign for one good",
                                    "rules": '{ "item_amount": 2, "discount": 500 }',
                                    "campaign_type": "good_discount",
                                    "date_from": '1649709512000',
                                    "date_to": '1651351115000'
                                  },
                                  {
                                    "name": "Promo campaign for one good",
                                    "rules": '{ "item_amount": 3, "discount": 1500 }',
                                    "campaign_type": "good_discount",
                                    "date_from": '1649709512000',
                                    "date_to": '1651351115000'
                                  },
                                  {
                                    "name": "Promo campaign for basket",
                                    "rules": '{ "min_total_price": 15000, "discount": 2000 }',
                                    "campaign_type": "basket_discount",
                                    "date_from": '1649709512000',
                                    "date_to": '1651351115000'
                                  }
                                 ])

items = Item.create([{
                       code: "A",
                       name: "Good A",
                       price: 3000.00,
                       image: "https://placeholder.pics/svg/150/DEDEDE/555555/Item%20A",
                       promo_campaigns: [campaigns[1]]
                     },
                     {
                       code: "B",
                       name: "Good B",
                       price: 2000.00,
                       image: "https://placeholder.pics/svg/150/DEDEDE/555555/Item%20B",
                       promo_campaigns: [campaigns[0]]
                     },
                     {
                       code: "C",
                       name: "Good C",
                       price: 5000.00,
                       image: "https://placeholder.pics/svg/150/DEDEDE/555555/Item%20C"
                     },
                     {
                       code: "D",
                       name: "Good D",
                       price: 1500.00,
                       image: "https://placeholder.pics/svg/150/DEDEDE/555555/Item%20D"
                     }
                    ])


