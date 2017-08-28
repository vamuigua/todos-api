class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    if @todo.update!(todo_params)
      render status:200, json: {
        message: "Todo successfully updated!"
      }
    end
  end

  # DELETE /todos/:id
  def destroy
    if @todo.destroy
      render status:200, json: {
        message: "Todo successfully deleted!"
      }
    end
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
