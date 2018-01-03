class TodosController < ApplicationController
  def index
    @todos = Todo.all

    respond_to do |format|
      format.html
      format.json do
        render json: @todos
      end
    end
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new
    @todo.content = params[:todo][:content]

    if @todo.save
      respond_to do |format|
        format.html do
          redirect_to todos_url
        end

        format.json do
          render json: @todo
        end
      end
    else
      render :new
    end
  end
end
