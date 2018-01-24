module Bootstrap
  module ViewHelpers
    module AccordionHelper
      def bs_accordion(options = {}, &block)
        Components::Accordion.new(self, options, &block).to_html
      end
    end
  end
end
