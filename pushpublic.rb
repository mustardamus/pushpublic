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

#redirect to the newest article
get "/" do
  entries = Dir.entries("articles")
  newest_article = entries[2]
  newest_time = File.open("articles/#{entries[2]}").ctime
  
  entries.each do |dir|
    unless dir[0] == 46 #char 46 = .
      newest_article = dir if newest_time < File.open("articles/#{dir}").ctime
    end
  end
  
  erb File.read "articles/#{newest_article}/article.erb"
end

#404 error
error 404 do
  erb :fof
end