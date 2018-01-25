require_relative 'components/style_not_found_error'
require_relative 'contextual_classes'

module Bootstrap
  module ViewHelpers
    class Component
      attr_reader :view, :options, :block, :style

      def initialize(view_context, options, &block)
        @view = view_context
        parse_options(options)
        @block = block
      end

      def to_html; end

      protected

      delegate :content_tag, :safe_join, :concat, :capture, :link_to,
               :button_tag, to: :view

      def defaults
        { style: ContextualClasses::PRIMARY }
      end

      def assign_and_validate_style
        style = options.delete(:style) || defaults[:style]
        return @style = style if ContextualClasses.valid?(style)
        raise Components::StyleNotFoundError.new(style)
      end

      def parse_options(options)
        @options = options
        assign_and_validate_style
      end
    end

    module Components; end
  end
end
