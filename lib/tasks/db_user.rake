## sometimes deployments require this next line
#require 'rubygems'
require 'active_record'  
require 'yaml'  
require 'config/environment.rb'

#this assumes the existence of databases
namespace :db do 
  namespace :user do
    desc "create user and grant privileges"
    task :create => [:load_config, :create_user, :promote] do |t|
    end
    
    desc "drop database user"
    task :drop => :load_config do |t|
      sql = "drop user '#{@config["username"]}'@'#{@config["host"]}';"
      cmd = "mysql -u #{@yml["db_admin_uid"]} -p -e \"#{sql}\""
      sh cmd
    end
   
    desc "align security - revoke create/drop on *.*, grant all on <database>.*"
    task :secure => [:demote, :grant] do |t|
    end

    task :create_user => :load_config do |t|
      sql = "create user '#{@config["username"]}'@'#{@config["host"]}' identified by '#{@config["password"]}';"
      cmd = "mysql -u #{@yml["db_admin_uid"]} -p -e \"#{sql}\""
      sh cmd
    end

    task :grant => :load_config do |t|
      sql = "grant all on #{@config["database"]}.* to '#{@config["username"]}'@'#{@config["host"]}';"
      cmd = "mysql -u #{@yml["db_admin_uid"]} -p -e \"#{sql}\""
      sh cmd
    end

    task :promote => :load_config do |t|
      sql = "grant create on *.* to '#{@config["username"]}'@'#{@config["host"]}' with grant option;"
      cmd = "mysql -u #{@yml["db_admin_uid"]} -p -e \"#{sql}\""
      sh cmd
      sql = "grant drop on *.* to '#{@config["username"]}'@'#{@config["host"]}' with grant option;"
      cmd = "mysql -u #{@yml["db_admin_uid"]} -p -e \"#{sql}\""
      sh cmd
    end
    
    task :demote => :load_config do |t|
      sql = "revoke create on *.* from '#{@config["username"]}'@'#{@config["host"]}';"
      cmd = "mysql -u #{@yml["db_admin_uid"]} -p -e \"#{sql}\""
      sh cmd
      sql = "revoke drop on *.* from '#{@config["username"]}'@'#{@config["host"]}';"
      cmd = "mysql -u #{@yml["db_admin_uid"]} -p -e \"#{sql}\""
      sh cmd
    end

    task :load_config do |t|
      @yml = YAML::load(File.open('config/database.yml'))
      @config = @yml[RAILS_ENV]
    end
  end
end
