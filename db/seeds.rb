require "open-uri"

puts "Destroy all the DB"
Post.destroy_all
User.destroy_all
Category.destroy_all

puts "create all the categories"

Category.create(name: "Photography")
Category.create(name: "Painting")
Category.create(name: "Illustration")
Category.create(name: "Drawing")

drawing = Category.find_by(name: "Drawing")
photography = Category.find_by(name: "Photography")
illustration = Category.find_by(name: "Illustration")
painting = Category.find_by(name: "Painting")

puts "creating fake users"

description = "Lorem Ipsum is simply dummy text of the printing and
typesetting industry. Lorem Ipsum has been the industry's standard dummy
text ever since the 1500s, when an unknown printer took a galley of type and scram ;
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
Ipsum has been the industry's standard dummy text ever since the 1500s, when an
unknown printer took a galley of type and scram "

User.create(first_name: "Pablo", last_name: "Picasso",
  email: "pablopicasso@email.com", nickname: "pablito", password: "123456", category_id: painting.id, description: description)

User.create(first_name: "Henri", last_name: "Cartier",
  email: "henricartier@email.com", nickname: "hcb", password: "123456", category_id: photography.id, description: description)

User.create(first_name: "Lucie", last_name: "Gautier",
  email: "luciegautier@email.com", nickname: "lulu", password: "123456", category_id: illustration.id, description: description)

User.create(first_name: "George", last_name: "Remi",
  email: "georgeremi@email.com", nickname: "Herge", password: "123456", category_id: drawing.id, description: description)


henri = User.find_by(nickname: "hcb")
pablo = User.find_by(nickname: "pablito")
lucie = User.find_by(nickname: "lulu")
george = User.find_by(nickname: "Herge")

puts "creating fake posts"

#photos line 1

file = URI.open("https://img.freepik.com/photos-gratuite/paysage-naturel-coucher-soleil_23-2149134297.jpg?w=740&t=st=1669991594~exp=1669992194~hmac=d7783f9d397acd54c95770bff58956e37c0a6dcd5637621f4198437df3c5de4f")
post = Post.new(title: "Pink landscape", description: "sunset in the field", category_id: photography.id, user_id: henri.id)
post.photo.attach(io: file, filename: "sunset.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-gratuite/gratte-ciel-new-york-au-coucher-du-soleil-usa_268835-758.jpg?w=740&t=st=1669991642~exp=1669992242~hmac=08cba8c6ad050d9f582f14f400436dcdb910e436170f5dff82fe9a095d2c1823")
post = Post.new(title: "City lights", description: "Sunset lights in the big city", category_id: photography.id, user_id: henri.id)
post.photo.attach(io: file, filename: "light.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-gratuite/belle-plage-tropicale-mer-ocean-cocotier-au-lever-du-soleil_74190-7455.jpg?w=740&t=st=1669991678~exp=1669992278~hmac=3f48d95b0c59cb6989c669bda9503cb3592030779515fc430d3d4c89c5554449")
post = Post.new(title: "Island life", description: "Sunset lights in the island", category_id: photography.id, user_id: henri.id)
post.photo.attach(io: file, filename: "island.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-gratuite/plan-vertical-plan-eau-ciel-rose-pendant-coucher-du-soleil-parfait-pour-papier-peint_181624-5246.jpg?w=740&t=st=1669992289~exp=1669992889~hmac=c7239bb23535b2bf4b5f137b11541686458c18cca64d385b6f67e3c9efb0cbe0")
post = Post.new(title: "Sunset sea", description: "Sunset over the sea", category_id: photography.id, user_id: henri.id)
post.photo.attach(io: file, filename: "sea.png", content_type: "image/png")
post.save

#photos line 2

file = URI.open("https://img.freepik.com/photos-premium/pagodes-dorees-du-temple-bouddhiste-wat-pho-bangkok-thailande-temple-bouddhiste-au-coucher-du-soleil-bangkok_759575-1342.jpg?w=740")
post = Post.new(title: "Golden pagoda", description: "Golden temple pagoda", category_id: photography.id, user_id: henri.id)
post.photo.attach(io: file, filename: "pagoda.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-premium/chevre-au-sommet-montagne-au-coucher-du-soleil_692691-36.jpg?w=740")
post = Post.new(title: "Goat", description: "A goat on the top of a mountain", category_id: photography.id, user_id: henri.id)
post.photo.attach(io: file, filename: "goat.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-premium/infusion-cafe-alternative-exterieur-moment-rustique-atmospherique-verser-eau-chaude-bouilloire-acier-dans-goutteur-flacon-verre-filtre-mousse-cafe-fond-campagne-rurale-au-coucher-du-soleil_250813-2212.jpg?w=740")
post = Post.new(title: "Morning coffee", description: "What's better than a coffe on a field ?", category_id: photography.id, user_id: henri.id)
post.photo.attach(io: file, filename: "coffee.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-gratuite/tour-horloge-big-ben-londres-au-coucher-du-soleil-traitement-photographique-special_268835-1109.jpg?w=740&t=st=1669991783~exp=1669992383~hmac=c9999acb69a752c31b2099a810bdbf1c9fffd79c6fb24068f26f9ab4a0a813a3")
post = Post.new(title: "Big Ben", description: "Big ben is always shinning", category_id: photography.id, user_id: henri.id)
post.photo.attach(io: file, filename: "coffee.png", content_type: "image/png")
post.save

#paintings line 1

file = URI.open("https://img.freepik.com/photos-gratuite/poudre-pourpre-dispersee-table-bleue_23-2147964165.jpg?w=740&t=st=1669992808~exp=1669993408~hmac=a440c41af871f0b7ed3c2269900a2daaffe74bd2c321992ba061cdd5ea5d39ca")
post = Post.new(title: "Abstract pink", description: "beautiful absctract painting of pink camaïeu", category_id: painting.id, user_id: pablo.id)
post.photo.attach(io: file, filename: "pink.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-premium/texture-aquarelle-taches-aquarelle_76632-1793.jpg?w=740")
post = Post.new(title: "pink stain", description: "liquid pink painting", category_id: painting.id, user_id: pablo.id)
post.photo.attach(io: file, filename: "stain.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-gratuite/splash-aquarelle-texture-du-papier_23-2149033873.jpg?w=740&t=st=1669992716~exp=1669993316~hmac=b6c9bec5269df274cbbb3825c55eb36facf616ccb2ce7f8403a090266e9401b9")
post = Post.new(title: "blood", description: "blood painting", category_id: painting.id, user_id: pablo.id)
post.photo.attach(io: file, filename: "blood.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-premium/texture-couleur-grunge-vert-rouge_93314-3021.jpg?w=740")
post = Post.new(title: "grunge color", description: "Rothko inspiration", category_id: painting.id, user_id: pablo.id)
post.photo.attach(io: file, filename: "grunge.png", content_type: "image/png")
post.save

#paintings line 2

file = URI.open("https://img.freepik.com/photos-gratuite/peinture-texturee-creme-fond-transparent-oeuvre-abstraite_155003-21874.jpg?w=740&t=st=1669992713~exp=1669993313~hmac=979ceb28537748495deb983399ee55306c4a76f2915abb11681a99529e76d15c")
post = Post.new(title: "blue waves", description: "abstract painted waves", category_id: painting.id, user_id: pablo.id)
post.photo.attach(io: file, filename: "waves.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/fond-texture-abstrait-bleu-aquarelle_65186-2647.jpg?w=740&t=st=1669992715~exp=1669993315~hmac=949cd9766967d45c9944efe87869c6ccbfeb2c6e1aa36da321505b6ce0555b97")
post = Post.new(title: "storm", description: "storm time", category_id: painting.id, user_id: pablo.id)
post.photo.attach(io: file, filename: "storm.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/photos-gratuite/fond-peinture-acrylique-vue-dessus_23-2149127629.jpg?w=740&t=st=1669993258~exp=1669993858~hmac=85fade734f5c012a3530c00acca1734e14d9b112bee682593c3b79bfcb6b145e")
post = Post.new(title: "acrylic blue", description: "get lost in deep blue", category_id: painting.id, user_id: pablo.id)
post.photo.attach(io: file, filename: "blue.png", content_type: "image/png")
post.save

file = URI.open("https://as1.ftcdn.net/v2/jpg/05/16/25/64/1000_F_516256427_vFGImnbhSO1SCoTZ9WUSMiYkc3vd19Jp.jpg")
post = Post.new(title: "golden blue", description: "jewelling golden blue", category_id: painting.id, user_id: pablo.id)
post.photo.attach(io: file, filename: "jewel.png", content_type: "image/png")
post.save

#illustrations line 1

file = URI.open("https://img.freepik.com/vecteurs-libre/illustration-paysage-montagne-peinte_53876-8144.jpg?w=740&t=st=1669994059~exp=1669994659~hmac=ae4cdf67a94fb778051dbae735202ac0d4c6b3ba3379176616e1dc7f4fb2def0")
post = Post.new(title: "sunset mountain", description: "sunset mountain", category_id: illustration.id, user_id: lucie.id)
post.photo.attach(io: file, filename: "mountain.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/illustration-paysage-montagne-peinte_53876-8140.jpg?w=740&t=st=1669994010~exp=1669994610~hmac=960b906421cd021f46a766aaaeb5b2239018d54913b434d376ce84f030b55da7")
post = Post.new(title: "green mountain", description: "green mountain", category_id: illustration.id, user_id: lucie.id)
post.photo.attach(io: file, filename: "greenmountain.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/scene-sol-enneige-arbre-decore-lumieres_1308-84372.jpg?w=740&t=st=1669994304~exp=1669994904~hmac=8158a0b3338f6bca1153f87359958777f05aba12ed014ec3919e6dbc2ff5c828")
post = Post.new(title: "snow landscape", description: "snow landscape", category_id: illustration.id, user_id: lucie.id)
post.photo.attach(io: file, filename: "snow.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/vecteur-memphis-simple-ton-ceruleen_53876-140367.jpg?w=740&t=st=1669994157~exp=1669994757~hmac=96540d925fdb14dec045cf60bb139ccad123dc41a3134c7c2aebe9ee88214b2e")
post = Post.new(title: "blue beach", description: "blue beach", category_id: illustration.id, user_id: lucie.id)
post.photo.attach(io: file, filename: "blue beach.png", content_type: "image/png")
post.save

#illustrations line 2

file = URI.open("https://img.freepik.com/vecteurs-libre/fond-poisson-aquarelle_1176-201.jpg?w=740&t=st=1669994012~exp=1669994612~hmac=a2306132a97a8d1a61139bb2e485ca2113d29aa14f69bda8a78243d8729c74c0")
post = Post.new(title: "koi fish", description: "koi fish", category_id: illustration.id, user_id: lucie.id)
post.photo.attach(io: file, filename: "fish.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/affiche-lettrage-vecteur-motivation_250435-1044.jpg?w=740&t=st=1669994020~exp=1669994620~hmac=b1f0112e89d2eff81a7c2c03d13334e3103daa85297381484fdc635ec09b76fd")
post = Post.new(title: "work hard", description: "dreal big", category_id: illustration.id, user_id: lucie.id)
post.photo.attach(io: file, filename: "work.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-premium/fleur-graphique-illustration-croquis-tatouage-impression-croquis-noir-blanc-traits-peinture_162862-1291.jpg?w=740")
post = Post.new(title: "flower", description: "tattoo flower", category_id: illustration.id, user_id: lucie.id)
post.photo.attach(io: file, filename: "flower.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-premium/tatouage-crane-sucre-feminin-couleur-clipart-vectoriel-dessine-main_736790-88.jpg?w=740")
post = Post.new(title: "skull", description: "tattoo skull", category_id: illustration.id, user_id: lucie.id)
post.photo.attach(io: file, filename: "skull.png", content_type: "image/png")
post.save

#drawings line 1

file = URI.open("https://img.freepik.com/vecteurs-libre/tablette-peripherique-dessine-main-pc-ordinateur-portable-icones-ligne-doodle-telephone-intelligent_1284-52013.jpg?w=740&t=st=1669995916~exp=1669996516~hmac=0f214d0a35474ba904434ff0866793b760321f093275c9393ed3f0fa0bb8fd37")
post = Post.new(title: "computer", description: "computer", category_id: drawing.id, user_id: george.id)
post.photo.attach(io: file, filename: "computer.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/main-dessin-illustration-du-concept-liberte_53876-35531.jpg?w=740&t=st=1669995946~exp=1669996546~hmac=62dec14d336e3235fae3af9f0416dc38fa32aa8cb745c81483a2168cd1094438")
post = Post.new(title: "unchained", description: "unchained", category_id: drawing.id, user_id: george.id)
post.photo.attach(io: file, filename: "unchained.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/main-dessin-illustration-du-visage-humain_53876-15636.jpg?w=740&t=st=1669995950~exp=1669996550~hmac=7372394c1e113c63300e3cf5de2ba0da4dc35c70f31661face1fafbf97059b1c")
post = Post.new(title: "portrait", description: "woman portrait", category_id: drawing.id, user_id: george.id)
post.photo.attach(io: file, filename: "woman.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/main-dessin-illustration-du-concept-liberte_53876-35533.jpg?w=740&t=st=1669995954~exp=1669996554~hmac=a58c04bb8cd19a72ae9fb938c53fbe8daa571936c5eef4d0a2a76faaaf3893b6")
post = Post.new(title: "feather", description: "feather", category_id: drawing.id, user_id: george.id)
post.photo.attach(io: file, filename: "feather.png", content_type: "image/png")
post.save

#drawings line 2

file = URI.open("https://img.freepik.com/vecteurs-libre/comment-dessiner-vecteur-didacticiel-doodle-coquille_53876-173986.jpg?w=740&t=st=1669995963~exp=1669996563~hmac=7fc19c7ebbec6a3330d9cb85b207f9b72b9ed67c4870869c19b4c16dbff58d84")
post = Post.new(title: "shell", description: "how to draw a shell", category_id: drawing.id, user_id: george.id)
post.photo.attach(io: file, filename: "shell.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/comment-dessiner-vecteur-tutoriel-licorne-doodle_53876-173996.jpg?w=740&t=st=1669995964~exp=1669996564~hmac=e2538281367e56c3c1284fa4d730040d343a42ececb07e1d955970e1fcdb7b01")
post = Post.new(title: "unicorn", description: "how to draw a unicorn", category_id: drawing.id, user_id: george.id)
post.photo.attach(io: file, filename: "unicorn.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/comment-dessiner-vecteur-tutoriel-doodle-creme-glacee_53876-174045.jpg?w=740&t=st=1669995966~exp=1669996566~hmac=f8294532b02c5be0250f8ef6bffe227e7954922beee720819565aac8debc87cd")
post = Post.new(title: "icecream", description: "how to draw a icecream", category_id: drawing.id, user_id: george.id)
post.photo.attach(io: file, filename: "icecream.png", content_type: "image/png")
post.save

file = URI.open("https://img.freepik.com/vecteurs-libre/comment-dessiner-vecteur-tutoriel-doodle-arc-ciel_53876-173994.jpg?w=740&t=st=1669996453~exp=1669997053~hmac=a14d6a26bb5b83dcca5931c1eba42ec3da60f9570d7fb7f3d3eabfdd537523c5")
post = Post.new(title: "cloud", description: "how to draw a cloud", category_id: drawing.id, user_id: george.id)
post.photo.attach(io: file, filename: "cloud.png", content_type: "image/png")
post.save

puts "Created all users, categories and posts"
