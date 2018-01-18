module Bootstrap
  module ViewHelpers
    module Components
      class Button < Component
        class Checkbox < Button
          def to_html
            input_options = input_html_options
            content_tag(:label, html_options) do
              content_tag(:input, options.delete(:label), input_options)
            end
          end

          protected

          attr_reader :checked, :input_options

          def inject_class_name_to_options
            super
            options[:class] << ' disabled' if options[:disabled]
          end

          def html_options
            @checked ||= options.delete(:checked)
            options
          end

          def input_html_options
            input_options = options.slice!(:id, :name)
            @options, input_options = input_options, options
            @input_options ||= { id: SecureRandom.hex, checked: checked,
                               type: 'checkbox', autocomplete: 'off' }
                               .merge(input_options)
          end
        end
      end
    end
  end
end
