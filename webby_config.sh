echo "gem: --no-ri --no-rdoc" >> ~/gem.rc

 # install required gems
sudo gem install -v 1.9.0 liquid
sudo gem install tzinfo test-unit
sudo gem install authlogic
sudo gem install lockdown
sudo gem install mislav-will_paginate
 rake gems:install
echo WC_DB_ENGINE=${WC_DB_ENGINE}
 
echo "
login: &login
adapter: ${WC_DB_ENGINE}
database: ${WC_APP_NAME}
username: ${WC_APP_NAME}
password: ${WC_DB_PASSWORD}
host: localhost
" > config/database.yml
 
if [ "${WC_DB_ENGINE}" == "mysql" ]; then
echo "
production:
<<: *login
encoding: utf8
" >> config/database.yml
fi
 
rake config/initializers/session_store.rb
rake db:bootstrap RAILS_ENV=production
rake db:schema:load RAILS_ENV=production
rake db:populate RAILS_ENV=production
chown www-data log'
chown www-data files
chown www-data tmp
chown www-data public/plugin_assets
