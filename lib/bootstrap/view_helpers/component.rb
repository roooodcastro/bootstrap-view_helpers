module Bootstrap
  module ViewHelpers
    class Component
      attr_reader :view, :options, :block
      
      def initialize(view_context, options, &block)
        @view = view_context
        parse_options(options)
        @block = block
      end

      def to_html; end

      private

      delegate :content_tag, :safe_join, :concat, :capture, :link_to, to: :view

      def parse_options(options)
        @options = options
      end
    end

    module Components; end
  end
end
