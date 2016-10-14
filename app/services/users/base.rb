module Users
  class Base
    include Users::Common
    
    attr_reader :errors
    attr_reader :user

    def initialize user
      @user = user
      @errors = []
    end

  end
end
