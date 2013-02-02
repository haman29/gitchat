module LoginHelper

  def parse_response_body target_str
    pattern = '([^=]*)=([^&]*)'
    p = target_str.match(/#{pattern}/)
    return {p[1] => p[2]}
  end
end
