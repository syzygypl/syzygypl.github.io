all: Gemfile
	rm -fr _site/
	bundle exec jekyll serve -I

Gemfile:
	cp Gemfile.dist Gemfile
	bundle install
