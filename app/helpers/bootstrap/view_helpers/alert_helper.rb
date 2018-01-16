module Bootstrap
  module ViewHelpers
    module AlertHelper
      def bs_alert(title_or_options = nil, options = {}, &block)
        options = block.present? ? title_or_options : options
        options[:content] = block.present? ? nil : title_or_options

        Components::Alert.new(self, options || {}, &block).to_html
      end
    end
  end
end
