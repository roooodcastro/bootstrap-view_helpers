module Bootstrap
  module ViewHelpers
    module BadgeHelper
      def bs_badge(label_or_options = {}, options = {}, &block)
        options = label_or_options if block_given?
        options[:label] = label_or_options unless block_given?
        Components::Badge.new(self, options, &block).to_html
      end

      def bs_pill(label_or_options = {}, options = {}, &block)
        options = label_or_options if block_given?
        options[:label] = label_or_options unless block_given?
        options[:pill] = true
        Components::Badge.new(self, options, &block).to_html
      end
    end
  end
end
