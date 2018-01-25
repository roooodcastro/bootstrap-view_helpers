module Bootstrap
  module ViewHelpers
    module Components
      class StyleNotFoundError < StandardError
        def initialize(message)
          super("Contextual style \"#{message}\" does not exist")
        end
      end
    end
  end
end
