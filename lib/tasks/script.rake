require 'active_record'

namespace :script do
  desc "script/generate authenticated, migrations, scaffolds, models, controllers"
  task :generate => [
    "authenticated:generate", 
    "migrations:generate", 
    "scaffolds:generate", 
    "models:generate", 
    "controllers:generate"] do |t| 
  end

  desc "script/destroy authenticated, migrations, scaffolds, models, controllers"
  task :destroy => [
    "authenticated:destroy", 
    "migrations:destroy", 
    "scaffolds:destroy", 
    "models:destroy", 
    "controllers:destroy"] do |t| 
  end

  namespace :authenticated do 
    desc "script/generate authenticated"
    task :generate do |t|
      sh "script/generate authenticated user sessions --include-activation --aasm"
    end

    desc "script/destroy authenticated"
    task :destroy do |t|
      sh "script/destroy authenticated user sessions"
    end
  end

  namespace :migrations do 
    desc "script/generate migrations"
    task :generate do |t|
      sh "script/generate acts_as_taggable_on_migration"
    end

    desc "script/destroy migrations"
    task :destroy do |t|
      sh "script/destroy acts_as_taggable_on_migration"
    end
  end

  namespace :scaffolds do 
    desc "script/generate scaffolds"
    task :generate do |t|
      sh "script/generate scaffold user name:string login:string email:string crypted_password:string salt:string remember_token:string remember_token_expires_at:datetime activation_code:string activated_at:datetime password_reset_code:string enabled:boolean"
      sh "script/generate scaffold question user:references title:string body:text html:text question_status:integer"
      sh "script/generate scaffold solution question:references user:references title:string body:text html:text solution_status:integer"
      sh "script/generate scaffold note question:references user:references description:string"
      sh "script/generate scaffold schoolquarter name:string schoolyear:integer quarter:integer"
      sh "script/generate scaffold course name:string code:string"
      sh "script/generate scaffold offering course:references schoolquarter:references section:string"
      sh "script/generate scaffold lab offering:references user:references title:string week:integer"
      sh "script/generate scaffold comment user:references lab:references description:string"
      sh "script/generate scaffold difficulty name:string ordinal:integer"
      sh "script/generate scaffold effectiveness name:string ordinal:integer"
    end

    desc "script/destroy scaffolds"
    task :destroy do |t|
      sh "script/destroy scaffold user"
      sh "script/destroy scaffold question"
      sh "script/destroy scaffold solution"
      sh "script/destroy scaffold note"
      sh "script/destroy scaffold schoolquarter"
      sh "script/destroy scaffold course"
      sh "script/destroy scaffold offering"
      sh "script/destroy scaffold lab"
      sh "script/destroy scaffold comment"
      sh "script/destroy scaffold difficulty"
      sh "script/destroy scaffold effectiveness"
      sh "script/destroy scaffold acts_as_taggable_on_migration"
    end
  end

  namespace :models do
    desc "script/generate models"
    task :generate do |t|
      sh "script/generate model labquestion lab:references question:references"
      sh "script/generate model difficultyquestion difficulty:references question:references user:references"
      sh "script/generate model effectivenessquestion effectiveness:references question:references user:references"
    end

    desc "script/destroy models"
    task :destroy do |t|
      sh "script/destroy model labquestion"
      sh "script/destroy model difficultyquestion"
      sh "script/destroy model effectivenessquestion"
    end
  end

  namespace :controllers do
    desc "script/generate controllers"
    task :generate do |t|
      sh "script/generate controller builder"
    end

    desc "script/destroy controllers"
    task :destroy do |t|
      sh "script/destroy controller builder"
    end
  end
end
