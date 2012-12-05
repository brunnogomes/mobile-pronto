module MobilePronto
  class Parameters

    attr_reader :value

    def initialize(credencial)
      @value = {"CREDENCIAL" => credencial}
    end
    
    def method_missing(name, *args)
      obj = self.dup

      obj[name.to_s.gsub!("with_", "").upcase] = args.first

      obj
    end

    def []=(key, value)
      self.value[key] = value
    end
  end
end