class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
  	@tasks = current_user.tasks.order(created_at: :desc)
  end

  def create
  	@task = current_user.tasks.new(task_params)

  	if params[:back].present?
  		render :new
  		return

  	if @task.save
  		redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
  	else
  		render :new
  	end
  end

  def confirm_new
  	@task = current_user.tasks.new(task_params)
  	render :new unless @task.valid?
  end

  def show
  end

  def new
  	@task = Task.new
  end

  def edit
  end

  def update
  	if	@task.update!(task_params)
	  	redirect_to tasks_url, notice: "タスク「#{@task.name}]を更新しました。"
	  else
  		render :edit
  	end
  end

  def destroy
  	@task.destroy
  	redirect_to tasks_url, notice: "タスク「#{@task.name}]を削除しました。"
  end

  private

  def task_params
  	params.require(:task).permit(:name, :description)
  end

  def set_task
  	@task = current_user.tasks.find(params[:id])
  end
end
