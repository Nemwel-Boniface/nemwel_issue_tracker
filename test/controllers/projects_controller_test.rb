require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include ActionDispatch::TestProcess::FixtureFile

  setup do
    @user = users(:one)
    sign_in users(:one)
    @project = projects(:one)
    sign_in @user
  end

  test 'should get index' do
    get projects_url
    assert_response :success
  end

  test "Should see elements in the projects index" do
    get projects_url
    assert_select "div div h2", "My Projects"
    assert_select "div div a", "New Project"
    assert_select "div h5", @project.title
    assert_select "div p", @project.description
    assert_select "div p strong", @project.user.full_names
    assert_select "div a", "View"
    assert_select "div a", "Edit"
    assert_select "div button", "Delete"
  end

  test 'should get new' do
    get new_project_url
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url,
           params: { project: { description: @project.description, title: @project.title, user_id: @project.user_id } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test 'should show project' do
    get project_url(@project)
    assert_response :success
  end

  test 'should get edit' do
    get edit_project_url(@project)
    assert_response :success
  end

  test 'should update project' do
    patch project_url(@project),
          params: { project: { description: @project.description, title: @project.title, user_id: @project.user_id } }
    assert_redirected_to project_url(@project)
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end

  test "Cannot delete project" do
    assert_difference("[Project].count" , 0) do
      delete project_url(projects(:two))
    end

    assert_redirected_to projects_url
  end
end
