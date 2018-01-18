require_relative '../contextual_classes'

module Bootstrap
  module ViewHelpers
    module Components
      class Alert < Component
        def to_html
          content_tag(:div, class: container_options[:class], role: 'alert') do
            concat(options[:content]) if options[:content]
            concat close_button
            block.call(self) if block.present?
          end
        end

        def alert_link_to(name = nil, opts = nil, html_options = nil, &block)
          link_to(name, opts, html_options.merge({ class: 'alert-link' }),
                  &block)
        end

        def type
          options[:type] || ContextualClasses::SECONDARY
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

        private

        def contextual_class
          return "alert-#{type}" if ContextualClasses.valid?(type)
          'alert-secondary'
        end

        def container_options
          default = { class: "alert #{contextual_class} " }
          default[:class] << 'alert-dismissible ' if dismissible?
          default[:class] << 'fade show ' if fade?
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
