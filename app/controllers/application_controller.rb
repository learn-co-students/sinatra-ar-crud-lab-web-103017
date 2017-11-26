require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   redirect '/posts'
  # end

  get '/posts' do
    @all_posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @new_post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @new_post = Post.find_by(id: params[:id])
    @new_post.name = params[:name]
    @new_post.content = params[:content]
    @new_post.save
    redirect "/posts/#{@new_post.id}"
  end

  get '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    Post.delete(@post)
    erb :delete
  end

end
