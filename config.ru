["rubygems", "sinatra", "erb", "less"].each do |gem| require gem end

disable :run
require "pushpublic"
run Sinatra::Application