module Bootstrap
  module ViewHelpers
    module Components
      class Button < Component
        class ButtonTypeNotFoundError < StandardError
          def initialize(type)
            super("Button type \"#{type}\" does not exist")
          end
        end
      end
    end
  end
end
