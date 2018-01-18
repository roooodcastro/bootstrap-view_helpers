module Bootstrap
  module ViewHelpers
    module Components
      class StyleNotFoundError < StandardError
        def initialize(style)
          super("Contextual style \"#{style}\" does not exist")
        end
      end
    end
  end
end
