# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'open-uri'

platformIDs = ['4925', '4926']
platformURL = 'http://thegamesdb.net/api/GetPlatformGames.php?platform='
gameURL = 'http://thegamesdb.net/api/GetGame.php?id='
baseImg = 'http://thegamesdb.net/banners/'

# doc = Nokogiri::HTML(open(platformURL + '4925'))
# docXML = Hash.from_xml(doc.to_s)
# gameList = docXML['html']['body']['data']

platformIDs.each do |pid|

  platDoc = Nokogiri::HTML(open(platformURL + pid))
  platDocXML = Hash.from_xml(platDoc.to_s)
  gameList = platDocXML['html']['body']['data']['game']

  i = 0 #temp
  # Uncomment for real test
  gameList.each do |game|
  # 5.times do #temp
  #   gid = gameList[i]['id'] #temp
    i += 1 #temp
    # Uncomment for real test
    gid = game['id']
    # gid = '27756'
    gameDoc = Nokogiri::HTML(open(gameURL + gid))
    gameDocXML = Hash.from_xml(gameDoc.to_s)
    gameInfo = gameDocXML['html']['body']['data']['game']
    title = gameInfo['gametitle']
    color = if pid.to_i == 4926 then 'Yes' else 'No' end
    puts color
    release_date = gameInfo['releasedate']
    description = gameInfo['overview']
    publisher = gameInfo['publisher']
    developer = gameInfo['developer']
    genre = ''
    img_url = ''
    back_url = ''
    puts 'Now Adding... ' + title
    # GENRE SECTION
    # puts gameInfo['genres']
    if gameInfo['genres']
      genres = gameInfo['genres']['genre']
      if genres.kind_of? (Array)
        genreString = ''
        genres.each do |val|
          genreString += val + ', '
        end
        genre = genreString[0...-2]
      else
        genreString = genres
      end
    end
    # puts genre

    # IMG SECTION
    # GETS FRONT AND BACK BOX ART
    boxImages = gameInfo['images']['boxart']
    if boxImages.kind_of?(Array)
      boxImages.each do |val|
        valTest = val.split('/')
        if valTest.include?('front')
          img_url = baseImg + val
        elsif valTest.include?('back')
          back_url = baseImg + val
        end
      end

    else
      img_url = baseImg + boxImages
    end

    Game.create(
      title: title,
      color: color,
      release_year: release_date,
      description: description,
      publisher: publisher,
      developer: developer,
      img_url: img_url,
      back_url: back_url,
      genre: genreString
    )
    puts 'In case of failure "I": ' + i.to_s + ' and Game ID#: ' + gid.to_s
    puts title + '!'
  end #ends each game loop
  puts pid + ' Complete!'
end #ends each platform loop
puts 'Wonderswan and Wonderswan Color Process Complete!'

User.create(
  username: 'brian',
  password: 'brian',
  email: 'bduggan3387@gmail.com',
  firstname: 'brian',
  lastname: 'duggan',
  permission: 1
)
puts 'brian created!'

#
