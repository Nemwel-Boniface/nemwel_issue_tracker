class IssuesController < ApplicationController
  before_action :set_issue, only: [:edit, :update, :destroy, :update_status]

  def create
    @project = Project.friendly.find(params[:project_id])
    @issue = @project.issues.build(issue_params.merge(user: current_user))

    if @issue.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project }
      end
    else
      render 'projects/show', status: :unprocessable_entity
    end
  end

  def edit
    @issue = Issue.find(params[:id])
    @project = @issue.project
  end

  def update
    if @issue.update(issue_params)
      redirect_to @issue.project, notice: "Issue updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @issue.project }
    end
  end

  def update_status
    @issue.update(status: params[:status])
    @project = @issue.project
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :priority, :status)
  end
end
