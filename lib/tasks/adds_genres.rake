namespace :adds_genres do

    task :default => [:uncommentGame, :find_genres]

    desc "reset the db"
    task :resetDB => :environment do
        Rake::Task["adds_genres:commentGame"].invoke
        Rake::Task["db:reset"].invoke
        Rake::Task["adds_genres:uncommentGame"].invoke
        Rake::Task["adds_genres:add_genres"].invoke
    end

    desc "uncomments acts as taggable"
    task :uncommentGame => :environment do
        puts 'Preparing game model for DB reset'
        path = Rake.original_dir + '/app/models/game.rb'
        gameModel = File.read(path)
        content = gameModel.gsub(/\s#/, "")
        File.open(path, 'wb') { |file| file.write(content) }
        puts 'Preparation complete'
    end

    desc "comments acts as taggable"
    task :commentGame => :environment do
        puts 'Preparing game model to create taggable genres'
        path = Rake.original_dir + '/app/models/game.rb'
        gameModel = File.read(path)
        content = gameModel.gsub(/#? acts_as_taggable_on/, "# acts_as_taggable_on")
        File.open(path, 'wb') { |file| file.write(content) }
        puts 'Preparation complete'
    end

    desc "add genres to games"
    task :add_genres => :environment do
        games = Game.all
        games.each do |game|
            if game.genre_list.length > 0
                puts "#{game.title} OK"
            else
                puts "Adding #{game.igenres} genre(s) to #{game.title}"
                game.genre_list.add(game.igenres, parse: true)
                game.save
                # puts "here are the genres #{game.genres.each {|t| puts t} }"
            end
        end
    end


end
