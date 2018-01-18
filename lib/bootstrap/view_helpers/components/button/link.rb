module Bootstrap
  module ViewHelpers
    module Components
      class Button < Component
        class Link < Button
          def to_html
            verify_disabled_link
            link_to(options.delete(:label), options.delete(:href), html_options)
          end

          protected

          def verify_disabled_link
            return unless options[:disabled]
            options[:tabindex] = '-1'
          end

          def inject_class_name_to_options
            super
            options[:class] << ' disabled' if options[:disabled]
          end

          def html_options
            options.merge({ role: :button })
          end
        end
      end
    end
  end
end
