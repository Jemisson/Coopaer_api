module AuthHelpers
  def configure_authorization
    admin = create(:admin)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, admin)
    request.headers.merge!(auth_headers)
  end
end
