require 'active_support/core_ext/module'

module Pverify

  ##
  # Pverify Request class
  #
  # Represents an authenticated request to the Pverify API.
  #
  # Not used directly. RestfulResource inherits from this and implements the core, common
  # methods used by the API.
  #

  class Request
    include HTTParty
    debug_output

    delegate :access_token, to: :authentication

    def get(path)
      perform_checks(path)
      url = build_url(path)
      response = send_authenticated(__callee__, url)
      Response.new(response)
    end

    alias_method :delete, :get

    def post(path, data = {})
      perform_checks(path)
      url = build_url(path)
      response = send_authenticated(__callee__, url, data)
      Response.new(response)
    end

    alias_method :put, :post
    alias_method :patch, :post

    def ping?
      # there is also a /ping endpoint in the root namespace
      # and it response with "healthy"
      get('ping').data == 'Ping OK'
    rescue
      false
    end

    private

    def send_authenticated(method, url, data = {})
      options = if data[:multipart]
        { headers: headers(data), 
          body: data, # don't covert to json here for multipart because it messes with files.
          multipart: true }
      else
        { headers: headers(data), 
          body: data.blank? ? nil : data.to_json }
      end

      response = self.class.public_send(
        method, url, options
      )

      if response.code == 401
        if response.parsed_response['message'] == 'The incoming token has expired'
          authentication.refresh_access_token!
          send_authenticated(method, url, data)
        else
          raise ::Pverify::AuthError, 'The token is invalid and cannot be refreshed'
        end
      else
        response
      end
    end

    def authentication
      @authentication ||= Pverify::Authentication.new
    end

    def build_url(path)
      sub_domain = path.include?("PDF") ? '/Report/' : '/api/'
      ['https://', authentication.oauth_domain, sub_domain, path].join
    end

    JSON_CONTENT_TYPE = 'application/json'
    MULTIPART_CONTENT_TYPE = 'multipart/form-data'

    def headers(data = {})
      content_type = data[:multipart] ? MULTIPART_CONTENT_TYPE : JSON_CONTENT_TYPE
      { 
        Authorization: "Bearer #{access_token}",
        'Client-User-Name': Pverify.configuration.username,
        'Content-Type': content_type,
        'Client-API-Id': Pverify.configuration.client_api_id,
        'Client-Secret': Pverify.configuration.client_secret
      }
    end

    def perform_checks(path)
      if access_token.blank?
        raise ::Pverify::AccessTokenNotPresentError, "Pverify access token not present"
      end

      # path must:
      # * not be blank
      # * contain a path besides just "/"
      if path.blank? || path.gsub('/', '').empty?
        raise ::Pverify::InvalidApiUrlError "Pverify API path passed appears invalid: #{path}"
      end
    end

  end

end