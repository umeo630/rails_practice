class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy] # %i[]で要素がシンボルの配列を作成できる
  # Task一覧ページ表示
  def index
    @tasks = Task.all
  end

  # Task作成画面表示
  def new
    @task = Task.new
  end

  # Task作成処理
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    end
  end

  # Task編集画面表示
  def edit
  end

  # Task更新処理
  def update
    if @task.update(task_params)
      redirect_to tasks_path
    end
  end

  # Task削除処理
  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  # ストロングパラメータ
  # permitで指定した項目を許可する
  private
  def task_params
    params.require(:task).permit(:content)
  end

  # id指定でTaskを取得
  def set_task
    @task = Task.find(params[:id])
  end
end
