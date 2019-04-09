all: Gemfile
	bundle exec jekyll serve -I

Gemfile:
	cp Gemfile.dist Gemfile
	bundle install
