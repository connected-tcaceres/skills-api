require "test_helper"

class TrainingSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training_session = training_sessions(:one)
  end

  test "should get index" do
    get training_sessions_url, as: :json
    assert_response :success
  end

  test "should create training_session" do
    assert_difference('TrainingSession.count') do
      post training_sessions_url, params: { training_session: { duration_hours: @training_session.duration_hours, notes: @training_session.notes, skill_id: @training_session.skill_id } }, as: :json
    end

    assert_response 201
  end

  test "should show training_session" do
    get training_session_url(@training_session), as: :json
    assert_response :success
  end

  test "should update training_session" do
    patch training_session_url(@training_session), params: { training_session: { duration_hours: @training_session.duration_hours, notes: @training_session.notes, skill_id: @training_session.skill_id } }, as: :json
    assert_response 200
  end

  test "should destroy training_session" do
    assert_difference('TrainingSession.count', -1) do
      delete training_session_url(@training_session), as: :json
    end

    assert_response 204
  end
end
