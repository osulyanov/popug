class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update complete destroy ]

  def index
    @tasks = Task.all
  end

  def my
    @tasks = Task.where(assignee: current_user)
    render :index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.creator = current_user

    if @task.save
      redirect_to task_url(@task), notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_url(@task), notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def complete
    @task.update(status: :done)

    redirect_back fallback_location: root_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.fetch(:task, {}).permit(:title, :description, :assignee)
    end
end
