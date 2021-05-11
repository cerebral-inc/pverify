module Pverify
  ##
  # Pverify Configuration class
  #

  class Configuration

    # [String] Environment to use - 'production' or 'sandbox'
    attr_reader :environment
    # [String] OAuth UserName (obtain from the Pverify portal)
    attr_accessor :username
    # [String] Oauth Password (obtain from the Pverify portal)
    attr_accessor :password
    # [String] Oauth Client api id
    attr_accessor :client_api_id
    # [String] Oauth client secret
    attr_accessor :client_secret


    # [Block] Method to fetch a persisted OAuth token
    attr_reader :persisted_token
    # [Block] Method to save a new OAuth token
    attr_reader :persist_token

    def initialize
      # default to sandbox environment
      @environment = :sandbox
    end

    def production?
      environment == :production
    end

    def sandbox?
      environment == :sandbox
    end

    def environment=(environment = :sandbox)
      @environment = environment.to_sym
    end

    def persisted_token=(block)
      @persisted_token = block if block.lambda? && block.arity == 0
    end

    def persist_token=(block)
      @persist_token = block if block.lambda? && block.arity == 1
    end

  end

end