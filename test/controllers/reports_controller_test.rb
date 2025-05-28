require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include ActionDispatch::TestProcess::FixtureFile

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get reports index' do
    get reports_url
    assert_response :success

    assert_select 'h2', 'Issue Report by Status'

    assert_select 'a[href=?]', project_issues_pdf_export_path(format: :pdf), text: 'Export Project Issues - PDF'

    assert_select 'a[href=?]', project_issues_export_path(format: :xlsx), text: 'Export Project Issues - Excel'
  end

  test 'should export project issues as xlsx' do
    get project_issues_export_url,
        headers: { 'Accept' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' }
    assert_response :success
    assert_equal 'attachment; filename=issues_by_project.xlsx', response.headers['Content-Disposition']
    assert_equal 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', response.media_type
  end

  test 'should export project issues as pdf' do
    get project_issues_pdf_export_url
    assert_response :success
    assert_equal 'application/pdf', response.media_type
  end
end
