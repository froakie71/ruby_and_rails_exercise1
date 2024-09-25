require 'securerandom'

class TodosController < ApplicationController
  def index
    @todos = session[:todos] || []
  end

  def new
    @todo = {}
  end

  def create
    todo = { id: SecureRandom.uuid, title: params[:title], completed: false }
    session[:todos] ||= []
    session[:todos] << todo
    redirect_to todos_path, notice: 'Todo was successfully created.'
  end

  def destroy
    session[:todos].reject! { |todo| todo[:id] == params[:id] }
    redirect_to todos_path, notice: 'Todo was successfully deleted.'
  end
end
