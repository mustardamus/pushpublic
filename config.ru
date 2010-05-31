["rubygems", "sinatra", "erb", "less", "nokogiri", "builder", "articles"].each do |gem| require gem end

disable :run
require "pushpublic"
run Sinatra::Application