module Bootstrap
  module ViewHelpers
    module ButtonHelper
      def bs_button(label, options = {}, &block)
        options[:label] = label
        Components::Button.build(self, options, &block).to_html
        button_tag
      end

      def bs_link_to(name = nil, path_opts = nil, options = nil, &block)
        options, path_opts, name = path_opts, name, block if block_given?
        options ||= {}
        options = options.merge({ href: path_opts, label: name, type: :link })
        Components::Button.build(self, options).to_html
      end

      def bs_checkbox_button(label, options = {}, &block)
        options = options.merge(label: label, type: :checkbox)
        Components::Button.build(self, options, &block).to_html
      end

      def bs_radio_button(label, options = {}, &block)
        options = options.merge(label: label, type: :radio)
        Components::Button.build(self, options, &block).to_html
      end
    end
  end
end
