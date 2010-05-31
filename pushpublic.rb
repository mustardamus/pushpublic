#handle main stylesheet
get "/css/main.css" do
  content_type "text/css", :charset => "utf-8"
  less :main
end

#handle article erb content
get "/articles/:article" do
  article_dir = "articles/#{params[:article]}"
  article_erb = "#{article_dir}/article.erb"
  
  File.exist?(article_erb) == true ? erb(File.read(article_erb)) : 404
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

#redirect to the newest article
get "/" do
  params[:article] = ARTICLES[0][:url]
  erb File.read "articles/#{ARTICLES[0][:url]}/article.erb"
end

#404 error
error 404 do
  erb :fof
end