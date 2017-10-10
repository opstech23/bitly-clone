# route to load index.rb

get '/' do
  erb :"static/index"
end

# On form action /submit post with this route


post '/submit' do
  url = Url.new(long_url: params["url"])
  url.short_url = url.base62
  url.save
  if request.xhr?
    erb :'static/index', layout: false
  else
    erb :'static/index'
  end
  # redirect "/#{url.short_url}"
  redirect '/'
  params.to_s
end

get '/:short_url' do
  a = Url.find_by(short_url: params[:short_url])
  redirect a.long_url
end
