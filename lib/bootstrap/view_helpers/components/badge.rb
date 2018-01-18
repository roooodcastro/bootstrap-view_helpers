require_relative '../contextual_classes'

module Bootstrap
  module ViewHelpers
    module Components
      class Badge < Component
        def to_html
          content_tag(:span, options) { options[:label] || block.call }
        end

        # Defaults to true
        def fade?
          return true if options[:fade].nil?
          options[:fade]
        end

        protected

        def parse_options(opts)
          super
          assign_and_validate_style
          inject_class_name
        end

        def inject_class_name
          pill = options[:pill] ? 'badge-pill' : ''
          class_name = "badge badge-#{style} #{pill} "
          class_name << options[:class] if options[:class].present?
          options[:class] = class_name
        end
      end
    end
  end
end
