module MobilePronto

  class SMS

    include HTTParty
 
    attr_accessor :credential, :username, :parameters

    base_uri "http://www.mpgateway.com/v_2_00"

    def initialize(credential, username)
      self.credential = credential
      self.username = username
      self.parameters = Parameters.new(self.credential)
    end

    def credits
      response = self.class.get "/smscredits/credits.aspx", query: parameters.value
      response.parsed_response
    end

    def send(mobile, aux_user, message)
      response = self.class.get "/smspush/enviasms.aspx",
        query: parameters.with_principal_user(username).
          with_aux_user(aux_user).with_mobile(mobile).
          with_message(message).with_send_project('N').value
      response.parsed_response
    end

    def follow(mobile, aux_user, message)
      response = self.class.get "/smsfollow/smsfollow.aspx",
        query: parameters.with_principal_user(username).
          with_aux_user(aux_user).with_mobile(mobile).
          with_message(message).with_send_project('N').value
      response.parsed_response
    end

    def status(message_id)
      response = self.class.get "/smsstatus/status.aspx", 
        query: parameters.with_id(message_id).value
      response.parsed_response
    end

    def query01(start_date, end_date, aux_user, mobile, status_code)
      response = self.class.get "/query01/query01.aspx",
       query: parameters.with_principal_user(username).
          with_aux_user(aux_user).with_mobile(mobile).
          with_status_code(status_code).with_start_date(start_date).
          with_end_date(end_date).value

      response.parsed_response
    end
  end
end
