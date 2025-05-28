require 'test_helper'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include ActionDispatch::TestProcess::FixtureFile

  setup do
    @user = users(:one)
    sign_in @user

    @project = projects(:one)
    @issue1 = issues(:one)
    @issue2 = issues(:three)
  end

  test 'should not allow user2 to view user1 issue' do
    sign_out @user
    sign_in users(:two)

    get project_issue_url(@project, @issue1)
    assert_response :not_found
  end

  test 'should create issue' do
    assert_difference('Issue.count') do
      post project_issues_url(@project), params: {
        issue: {
          title: 'New issue',
          status: 'New',
          priority: 1
        }
      }
    end

    assert_redirected_to project_url(@project)
  end

  test 'should not create issue with invalid data' do
    assert_no_difference('Issue.count') do
      post project_issues_url(@project), params: {
        issue: {
          title: '',
          status: '',
          priority: nil
        }
      }
    end

    assert_response :unprocessable_entity
  end
end
