module Bootstrap
  module ViewHelpers
    module Components
      class Button < Component
        class Close < Button
          def to_html
            button_tag(html_options) do
              content_tag(:span, '×', aria: { hidden: true })
            end
          end

          protected

          attr_reader :dismiss

          def verify_disabled_link
            return unless options[:disabled]
            options[:tabindex] = '-1'
          end

          def inject_data_attributes
            super
            @dismiss = options.delete(:dismiss) || 'modal'
          end

          def inject_class_name_to_options
            options[:class] ||= ''
            options[:class] << ' close'
          end

          def inject_aria_attributes
            options[:aria] ||= {}
            options[:aria][:label] = 'Fechar'
          end

          def html_options
            options.merge({ type: :button, data: { dismiss: dismiss } })
          end
        end
      end
    end
  end
end
