require 'base64'
require 'httparty'

module Pverify
  class Authentication
    def access_token
      @access_token ||= persisted_access_token || fetch_access_token
    end

    def refresh_access_token!
      @access_token = fetch_access_token
    end

    ##
    # OAuth domain to use (based on environment setting)
    #

    def oauth_domain
      if Pverify.configuration.production?
        'api.pverify.com'
      else
        'api.pverify.com/Test'
      end
    end

    protected
    ##
    # Gets a new access token from the Pverify OAuth provider
    #

    def fetch_access_token
      response = ::HTTParty.post(oauth_grant_url, headers: oauth_headers, body: oauth_body)
      new_token =
        if response.code == 200 && response.content_type == 'application/json'
          response&.parsed_response&.fetch('access_token', nil)
        end

      if new_token.nil?
        raise ::Pverify::AuthError, "There was a problem obtaining a Pverify access token from: #{oauth_grant_url}"
      end

      Pverify.configuration.persist_token&.call(new_token)
      new_token
    end

    def persisted_access_token
      Pverify.configuration.persisted_token&.call
    end

    # def credentials
    #   [Pverify.configuration.client_id, Pverify.configuration.client_secret].join(':')
    # end

    # def credentials_base64_encoded
    #   Base64.strict_encode64(credentials)
    # end

    def oauth_grant_url
      "https://#{oauth_domain}/token"
    end

    def oauth_headers
      { 'Content-Type' => 'application/x-www-form-urlencoded' }
    end

    def oauth_body
      { 
        'grant_type' => 'password',
        'username' => Pverify.configuration.username,
        'password' => Pverify.configuration.password
      }
    end

  end
end