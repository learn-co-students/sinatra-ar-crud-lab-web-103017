require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :"../views/new"
  end

  post '/posts' do
    Post.create(name: params['blog']['name'], content: params['blog']['content'])
    @posts = Post.all
    erb :"../views/index"
  end

  get '/posts' do
    @posts = Post.all
    erb :"../views/index"
  end

  get '/posts/:id' do
    @post = Post.find(params['id'])
    erb :"../views/show"
  end

  get '/posts/:id/edit' do
    #binding.pry
    @post = Post.find(params['id'])
    erb :"../views/edit"
  end

  patch '/posts/:id' do
    @post = Post.find(params['id'])
    @post.update(name: params['blog']['name'], content: params['blog']['content'])
    #binding.pry
    erb :"../views/show"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @deleted_post_name = @post.name
    @post.destroy
    erb :"../views/delete"
  end
end
