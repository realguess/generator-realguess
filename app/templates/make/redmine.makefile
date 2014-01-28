# @file

#
# Ruby variables.
#
RUBY_VERSION := 1.9.3

#
# Rails variables.
# 
RAILS_VERSION := 3.2.11
RAILS_ENV := production

#
# Redmine variables.
#
# The current installation is based on Redmine 2.2.2, with Ruby 1.9.3, Rails 3.2.11 and RubyGems 1.8.
#
INSTALL_ROOT := /opt
REDMINE_REPOS := https://github.com/edavis10/redmine.git
REDMINE_VERSION := 2.2.2
REDMINE_ROOT := ${INSTALL_ROOT}/redmine
REDMINE_ENV := production
REDMINE_USER := redmine
REDMINE_PASS := redmine
REDMINE_DATABASE := redmine
REDMINE_ADAPTER := mysql2

# FIXME:
# Install MySQL
#
# MySQL 5.0 or higher is recommended by Redmine 2.
#
# TODO: How to provide password during MySQL installation process
#
mysql:
	apt-get -y install mysql-server

#
# Install Ruby and extensions.
#
ruby:
	apt-get -y install ruby${RUBY_VERSION} rubygems libmysql-ruby libmysqlclient-dev

#
# Install Rails.
#
rails: ruby
	gem install -y rails --version ${RAILS_VERSION} mysql2 bundler

#
# Install Redmine.
#
# TODO See how Node's Makefile is written
#
redmine: mysql rails
	cd ${INSTALL_ROOT} && git clone ${REDMINE_REPOS}
	# TODO: Change the Makefile CWD otherwise, we need to type so many cds
	# TODO: Make it permanent for all the following actions
	cd ${REDMINE_ROOT}
	git checkout ${REDMINE_VERSION}
	bundle install --without development test rmagick postgresql sqlite
	
	echo "${REDMINE_ENV}:\n  adapter: ${REDMINE_ADAPTER}\n  database: ${REDMINE_DATABASE}\n  host: localhost\n  username: ${REDMINE_USER}\n  password: ${REDMINE_PASS}" > config/database.yml

	rake generate_secret_token
	# Will RAILS_ENV defined above be used here?
	rake db:migrate
	rake redmine:load_default_data

	cp config/configuration.yml.example config/configuration.yml

	adduser --system --group --no-create-home --disabled-login --shell /bin/bash ${REDMINE_USER}
	mkdir -p tmp public/plugin_assets
	chown -R ${REDMINE_USER}:${REDMINE_USER} files log tmp public/plugin_assets config/{database,configuration}.yml
	chmod -R 755 files log tmp public/plugin_assets
	chmod 400 config/{database,configuration}.yml

.PHONY: redmine
