web: bundle exec thin start -R config.ru -e $RAILS_ENV -p $PORT
worker: bundle exec rackup private_pub.ru -s thin -E production
