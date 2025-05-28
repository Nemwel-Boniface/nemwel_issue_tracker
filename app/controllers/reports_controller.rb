class ReportsController < ApplicationController
  before_action :authenticate_user!
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

  def project_issues_pdf_export
    @projects = Project.includes(:issues)

    pdf = Prawn::Document.new
    pdf.text 'Project Issues Report', size: 20, style: :bold, align: :center
    pdf.move_down 20

    @projects.each do |project|
      pdf.text project.title, size: 16, style: :bold
      pdf.move_down 5

      if project.issues.any?
        project.issues.each do |issue|
          pdf.indent(20) do
            pdf.text "• Title: #{issue.title}", size: 12
            pdf.text "  Status: #{issue.status}", size: 12
            pdf.text "  Priority: #{issue.priority}", size: 12
            pdf.move_down 5
          end
        end
      else
        pdf.indent(20) do
          pdf.text 'This project has no issues created', size: 12, style: :italic
        end
      end

      pdf.move_down 15
    end

    send_data pdf.render,
              filename: "project_issues_#{Date.today}.pdf",
              type: 'application/pdf',
              disposition: 'inline'
  end
end
