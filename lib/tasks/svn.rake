namespace :svn do
  desc "configure subversion for rails"
  task :configure_for_svn do
    sh "svn remove log/*"
    sh "svn commit -m 'removing all log files from subversion'"
    sh "svn propset svn:ignore '*.log' log/"
    sh "svn update log/"
    sh "svn commit -m 'ignoring all files in /log/ ending in .log'"
   
    sh "svn propset svn:ignore '*.db' db/"
    sh "svn update db/"
    sh "svn commit -m 'ignoring all files in db/ ending in .db'"
    
    sh "svn move config/database.yml config/database.example"
    sh "svn commit -m 'moving database.yml to database.example to provide a template for anyone who checks out the code'"
    sh "svn propset svn:ignore 'database.yml' config/"
    sh "svn update config/"
    sh "svn commit -m 'ignoring database.yml dispatch.fcgi .htaccess'"
    
    sh "svn propset svn:ignore 'dispatch.fcgi' config/"
    sh "svn update config/"
    sh "svn commit -m 'ignoring dispatch.fcgi'"

    sh "svn propset svn:ignore 'tmp/cache/*' tmp/cache/"
    sh "svn update tmp/cache/"
    sh "svn commit -m 'ignoring all files in tmp/cache/'"

    sh "svn propset svn:ignore 'tmp/pids/*' tmp/pids/"
    sh "svn update tmp/pids/"
    sh "svn commit -m 'ignoring all files in tmp/pids/'"

    sh "svn propset svn:ignore 'tmp/sessions/*' tmp/sessions/"
    sh "svn update tmp/sessions/"
    sh "svn commit -m 'ignoring all files in tmp/sessions/'"

    sh "svn propset svn:ignore 'tmp/sockets/*' tmp/sockets/"
    sh "svn update tmp/sockets/"
    sh "svn commit -m 'ignoring all files in tmp/sockets/'"
    sh "svn commit -m'ignoring files'"
  end
   
  desc "add new files to subversion"
  task :add_new_files do
    sh "svn status | grep '^\?' | sed -e 's/? *//' | sed -e 's/ /\ /g' | xargs svn add"
  end

  desc "remove deleted files to subversion"
  task :remove_deleted_files do
    sh "svn status | grep '^!' | sed -e 's/! *//' | sed -e 's/ /\ /g' | xargs svn remove"
  end

  desc "shortcut for configuring subversion for rails"
  task :configure => [ :configure_for_svn ]

  desc "shortcut for adding new files"
  task :add => [ :add_new_files ]
  
  desc "shortcut for removing deleted files"
  task :rm => [ :remove_deleted_files ]
end
