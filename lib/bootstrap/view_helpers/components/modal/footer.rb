module Bootstrap
  module ViewHelpers
    module Components
      class Modal < Component
        class Footer < Component
          def to_html
            content_tag(:div, options) { block.call(self) if block.present? }
          end

          def close_button(label, close_options = {})
            close_options = close_button_default_options.merge(close_options)
            close_options[:label] = label
            Button.new(view, close_options).to_html
          end

          protected

          def close_button_default_options
            { data: { dismiss: 'modal' }, style: :secondary, type: :button }
          end

          def inject_class_name_to_options
            options[:class] = "modal-footer #{options[:class]}"
            options[:class].strip!
          end

          def parse_options(options)
            super
            inject_class_name_to_options
          end
        end
      end
    end
  end
end
