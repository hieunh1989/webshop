namespace :db do
  task :remake => :environment do
    if Rails.env.development?
      Rake::Task['db:mongoid:drop'].invoke
      Rake::Task['db:seed'].invoke
      Rake::Task['db:mongoid:create_indexes'].invoke
    end
  end
end