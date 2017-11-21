require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end
  #create
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    new_post = Post.create(name: params[:name],  content: params[:content])
    redirect "/posts"
  end
  #read
  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  #Update
  get '/posts/:id/edit' do
    @id = params[:id]
    @post = Post.find_by(id: @id)
    erb :edit
  end

  patch '/posts/:id' do
    upost = Post.find_by(id: params[:id])
    upost.update(name: params[:name], content: params[:content])
    id = params[:id]
    redirect "/posts/#{id}"
  end

  #delete
  delete '/posts/:id/delete' do
    post = Post.find_by(id: params[:id])
    @post = post.name
    post.destroy
    erb :delete
  end
end
