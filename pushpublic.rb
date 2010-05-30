get "/css/:style.css" do
  content_type "text/css", :charset => "utf-8"
  less params[:style].to_sym
end

get "/" do
  erb :index
end