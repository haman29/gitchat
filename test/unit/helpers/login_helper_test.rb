require 'test_helper'

class LoginHelperTest < ActionView::TestCase
  def test_parse_response_body
    body = parse_response_body('error=bad_verification_code')
    assert_equal 'bad_verification_code', body["error"]

    body = parse_response_body('access_token=9ff25e62229390442424a68dd50ab23705685f4e&token_type=bearer')
    assert_nil body["error"]
    assert_equal '9ff25e62229390442424a68dd50ab23705685f4e', body["access_token"]
  end
end
