module Bootstrap
  module ViewHelpers
    module CardHelper
      def bs_card(title_or_options = nil, options = {}, &block)
        options = title_or_options if block && title_or_options.is_a?(Hash)
        options[:title] = title_or_options if title_or_options.is_a?(String)

        Components::Card.new(self, options || {}, &block).to_html
      end

      def bs_card_header(title_or_options = nil, options = {}, &block)
        options = title_or_options if block && title_or_options.is_a?(Hash)
        options[:title] = title_or_options if title_or_options.is_a?(String)

        Components::Card.new(self, options || {}, &block).header
      end
    end
  end
end
