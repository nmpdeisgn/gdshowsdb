class GdshowsdatabaseGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  @@migrations_dir = File.expand_path('../../db/migrations', __FILE__) 
  source_root @@migrations_dir

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_migration_files
    Dir.entries(@@migrations_dir).each do |file|
      migration_template(file, "db/migration/#{file.sub(/\d\d\d_/, '')}") unless File.directory?(file)
    end    
  end
end