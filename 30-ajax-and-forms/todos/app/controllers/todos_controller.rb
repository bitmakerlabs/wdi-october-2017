class TodosController < ApplicationController
  before_action :load_todo, only: [:show, :destroy, :update]

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      # HTML Response only

      # if request.xhr?
      #   render partial: 'todos/todo', object: @todo
      # else
      #   redirect_to root_path
      # end

      # Multiple Response Types
      respond_to do |format|
        format.html do
          redirect_to root_path
        end

        format.json { render json: @todo }
      end
    else
      render :new
    end
  end

  def show

  end

  def update
    if @todo.completed_at
      @todo.update(completed_at: nil)
    else
      @todo.update(completed_at: Time.now)
    end

    respond_to do |format|
      format.json { render json: @todo }
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:task, :completed_at)
  end

  def load_todo
    @todo = Todo.find(params[:id])
  end
end
