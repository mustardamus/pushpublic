get "/css/:style.css" do
  content_type "text/css", :charset => "utf-8"
  less params[:style].to_sym
end

get "/articles/:name" do
  article_dir = "articles/#{params[:name]}"
  article_erb = "#{article_dir}/article.erb"
  
  if File.exist? article_erb
    erb File.read "#{article_dir}/article.erb"
  else
    404
  end
end

get "/" do
  erb :index
end

error 404 do
  erb :fof
end