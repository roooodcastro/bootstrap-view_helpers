module Bootstrap
  module ViewHelpers
    class Component
      def initialize(view_context, options, &block)
        @view = view_context
        @options = options
        @block = block
      end

      def to_html; end

      private

      attr_reader :view, :options, :block
      delegate :content_tag, :safe_join, :concat, :capture, :link_to, to: :view
    end

    module Components; end
  end
end
