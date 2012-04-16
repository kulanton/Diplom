namespace :fill do
  desc = "Fill DataBase by Groups"
  task :groups => :environment do
    groups = Group.all
    for group in groups
      puts group.name
    end
    puts "Database is filled by Groups"
  end
  
  task :all => [:groups]
end
