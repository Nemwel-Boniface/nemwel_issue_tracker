class ReportsController < ApplicationController
  def index
    @issues_by_status = Issue.group(:status).count
  end
end
