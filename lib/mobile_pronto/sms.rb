module MobilePronto

  class SMS

    include HTTParty
 
    attr_accessor :credential
    attr_accessor :username

    base_uri "http://www.mpgateway.com/v_2_00"

    def initialize(credential, username)
      self.credential = credential
      self.username = username
    end

    def credits
      response = self.class.get "/smscredits/credits.aspx", query: {'CREDENCIAL' => self.credential}
      response.parsed_response
    end

    def send(mobile, aux_user, message)
      response = self.class.get "/smspush/enviasms.aspx",
        query: {"CREDENCIAL" => self.credential, "PRINCIPAL_USER" => self.username,
        "AUX_USER" => aux_user, "MOBILE" => mobile, "MESSAGE" => message, "SEND_PROJECT" => "N"}

      response.parsed_response
    end

    def follow(mobile, aux_user, message)
      response = self.class.get "/smsfollow/smsfollow.aspx",
        query: {"CREDENCIAL" => self.credential, "PRINCIPAL_USER" => self.username,
          "AUX_USER" => aux_user, "MOBILE" => mobile, "SEND_PROJECT" => "N", "MESSAGE" => message}
      response.parsed_response
    end

    def status(message_id)
      response = self.class.get "/smsstatus/status.aspx?CREDENCIAL=#{self.credential}&ID=#{message_id}"
      response.parsed_response
    end

    def query01(start_date, end_date, aux_user, mobile, status_code)
      response = self.class.get "/query01/query01.aspx",
        query: {"CREDENCIAL" => self.credential, "PRINCIPAL_USER" => self.username,
        "AUX_USER" => aux_user, "MOBILE" => mobile, "STATUS_CODE" => status_code,
        "START_DATE" => start_date, "END_DATE" => end_date}
      response.parsed_response
    end
  end
end
