require 'test_helper'

class TesteControllerTest < ActionDispatch::IntegrationTest
  test "should get mostrar" do
    get teste_mostrar_url
    assert_response :success
  end

end
