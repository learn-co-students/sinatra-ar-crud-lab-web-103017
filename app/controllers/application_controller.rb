require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    # Post.create(:name => params[:name], :content => params[:content])
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id].to_i)
    @post.delete

    erb :delete
  end
end
