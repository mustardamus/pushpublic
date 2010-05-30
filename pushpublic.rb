#handle main stylesheet
get "/css/main.css" do
  content_type "text/css", :charset => "utf-8"
  less :main
end

#handle article erb content
get "/articles/:name" do
  article_dir = "articles/#{params[:name]}"
  article_erb = "#{article_dir}/article.erb"
  
  if File.exist? article_erb
    erb File.read "#{article_dir}/article.erb"
  else
    404
  end
end

#handle article stylesheet
get "/articles/:name/:style.css" do
  content_type "text/css", :charset => "utf-8"
  less File.read "articles/#{params[:name]}/#{params[:style]}.less"
end

#index
get "/" do
  erb :index
end

#404 error
error 404 do
  erb :fof
end