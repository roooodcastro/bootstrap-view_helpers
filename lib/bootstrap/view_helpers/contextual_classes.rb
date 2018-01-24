module Bootstrap
  module ViewHelpers
    class ContextualClasses
      PRIMARY   = 'primary'.freeze
      SECONDARY = 'secondary'.freeze
      SUCCESS   = 'success'.freeze
      INFO      = 'info'.freeze
      WARNING   = 'warning'.freeze
      DANGER    = 'danger'.freeze
      LIGHT     = 'light'.freeze
      DARK      = 'dark'.freeze
      LINK      = 'link'.freeze

      ALL = [PRIMARY, SECONDARY, SUCCESS, INFO, WARNING, DANGER, LIGHT, DARK,
             LINK]

      def self.valid?(style)
        ALL.include?(style.to_s.freeze)
      end
    end
  end
end
