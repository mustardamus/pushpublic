["rubygems", "sinatra", "erb", "less", "builder", "articles"].each do |gem| require gem end

disable :run
require "pushpublic"
run Sinatra::Application