module Bootstrap
  module ViewHelpers
    module Components
      class Alert < Component
        def to_html
          content_tag(:div, options) do
            concat(options[:content]) if options[:content]
            concat close_button
            block.call(self) if block.present?
          end
        end

        def alert_link_to(name = nil, opts = nil, html_options = nil, &block)
          link_to(name, opts, html_options.merge({ class: 'alert-link' }),
                  &block)
        end

        # Defaults to false
        def dismissible?
          options[:dismissible]
        end

        # Defaults to true
        def fade?
          return true if options[:fade].nil?
          options[:fade]
        end

        protected

        def defaults
          { style: ContextualClasses::SECONDARY }
        end

        def parse_options(_)
          super
          inject_class_name
          options[:role] = 'alert'
          options[:style] = options[:html_style]
        end

        def inject_class_name
          class_name = "alert alert-#{style} "
          class_name << 'alert-dismissible ' if dismissible?
          class_name << 'fade show ' if fade?
          class_name << options.delete(:class) if options[:class]
          options[:class] = class_name
        end

        def container_options
          default = { class: "alert alert-#{style}#{' fade show' if fade?} " }
          default[:class] << 'alert-dismissible ' if dismissible?
          default[:class] << options.delete(:class) if options[:class]
          default.merge(options)
        end

        def close_button
          return unless dismissible?
          content_tag(:button, class: 'close', data: { dismiss: 'alert' },
                      aria: { label: 'Close' }) do
            content_tag(:span, '×', aria: { hidden: true })
          end
        end
      end
    end
  end
end
