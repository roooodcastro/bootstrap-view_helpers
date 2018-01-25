module Bootstrap
  module ViewHelpers
    module Components
      class Modal < Component
        class Body < Component
          def to_html
            content_tag(:div, options) { block.call(self) if block.present? }
          end

          protected

          def inject_class_name_to_options
            options[:class] = "modal-body #{options[:class]}"
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
