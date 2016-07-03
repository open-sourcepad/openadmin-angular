module Users
  class Base
    include Users::Common
    
    attr_reader :errors

    def initialize user
      @user = user
      @errors = []
    end

  end
end
