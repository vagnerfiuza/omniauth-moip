require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Moip < OmniAuth::Strategies::OAuth2

      option :name, "moip"

      option :client_options, { site: "https://connect.moip.com.br" }

      uid{ access_token["moipAccountId"] }

      option :token_options, [ :redirect_uri ]

      def client
        if options.environment == :sandbox
          options.client_options.site = "https://connect-sandbox.moip.com.br"
        end

        super
      end

    end
  end
end
