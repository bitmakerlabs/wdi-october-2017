class TodosController < ApplicationController
  def create
      @todo = Todo.new
      @todo.content = params[:todo][:content]

    if @todo.save
      respond_to do |format|
          format.html do
            if request.xhr?
              render partial: 'todo' , locals: {todo: @todo}
            else
            redirect_to root_url
            end
          end
          format.json { render json: @todo}
      end
    end
  end

  def new
      @todo = Todo.new
  end

  def index
    @todos = Todo.all
    @todo = Todo.new
  end
end
