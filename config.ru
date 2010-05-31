["rubygems", "sinatra", "erb", "less", "articles"].each do |gem| require gem end

disable :run
require "pushpublic"
run Sinatra::Application