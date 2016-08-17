# Documentation Sunspot

This is a module for Documentation which replaces the searcher searcher with one powered by Sunspot and Apache's Solr.  See http://sunspot.github.com/ for more information about Sunspot.

## Installation

Add the gem to your Gemfile and run `bundle`.

```ruby
gem 'documentation-sunspot'
```

Once installed, you should add an initializer to your Rails application to add configuration.

```ruby
Documentation.config.searcher = Documentation::Searchers::Sunspot.new
```

## Setup

Once installed, you'll probably want to index all your documents.

```ruby
# Remove any existing index
Documentation.config.searcher.reset
# Index all pages
Documentation::Page.all.each(&:index)
```
