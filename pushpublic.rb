#handle main stylesheet
get "/css/main.css" do
  content_type "text/css", :charset => "utf-8"
  less :main
end

#handle article erb content
get "/articles/:article" do
  article_dir = "articles/#{params[:article]}"
  article_erb = "#{article_dir}/article.erb"
  
  if File.exist? article_erb
    erb File.read "#{article_dir}/article.erb"
  else
    404
  end
end

#handle article stylesheet
get "/articles/:article/:stylesheet.css" do
  content_type "text/css", :charset => "utf-8"
  less File.read "articles/#{params[:article]}/#{params[:stylesheet]}.less"
end

#handle article javascript
get "/articles/:article/:javascript.js" do
  content_type "text/javascript", :charset => "utf-8"
  File.read "articles/#{params[:article]}/#{params[:javascript]}.js"
end

#index
get "/" do
  erb :index
end

#404 error
error 404 do
  erb :fof
end