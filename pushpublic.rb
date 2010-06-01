get "/css/main.css" do
  content_type "text/css", :charset => "utf-8"
  less :main
end

get "/articles/:article" do
  article_erb = "articles/#{params[:article]}/article.erb"
  File.exist?(article_erb) == true ? erb(File.read(article_erb)) : 404
end

get "/articles/:article/:stylesheet.css" do
  content_type "text/css", :charset => "utf-8"
  less File.read "articles/#{params[:article]}/#{params[:stylesheet]}.less"
end

get "/articles/:article/:javascript.js" do
  content_type "text/javascript", :charset => "utf-8"
  File.read "articles/#{params[:article]}/#{params[:javascript]}.js"
end

get "/" do
  params[:article] = ARTICLES[0][:url]
  erb File.read "articles/#{ARTICLES[0][:url]}/article.erb"
end

get "/rss.xml" do
  builder :rss
end

error 404 do
  erb :fof
end