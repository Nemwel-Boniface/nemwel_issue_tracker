class ReportsController < ApplicationController
  def index
    @issues_by_status = Issue.group(:status).count
  end

  def project_issues_export
    @projects = Project.includes(:issues)

    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = 'attachment; filename=issues_by_project.xlsx'
      end
    end
  end
end
