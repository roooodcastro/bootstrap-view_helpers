require_relative '../contextual_classes'
require_relative 'button/button_type_not_found_error'
require_relative 'button/checkbox'
require_relative 'button/close'
require_relative 'button/link'
require_relative 'button/radio'

module Bootstrap
  module ViewHelpers
    module Components
      class Button < Component
        TYPES = {
          button: Button,
          checkbox: Button::Checkbox,
          close: Button::Close,
          link: Button::Link,
          radio: Button::Radio
        }

        class << self
          def build(view_context, options, &block)
            type = options.delete(:type) || defaults[:type]
            options[:type] = options[:html_type]
            unless TYPES.keys.include? type
              raise ButtonTypeNotFoundError, type
            end
            TYPES[type].new(view_context, options, &block)
          end

          protected

          def defaults
            { type: :button, style: ContextualClasses::PRIMARY }
          end
        end

        def to_html
          content_tag(:button, label, html_options)
        end

        protected

        attr_reader :label

        def defaults
          Button.send(:defaults)
        end

        def inject_additional_attributes
          inject_class_name_to_options
          inject_aria_attributes
          inject_data_attributes
          @label = options.delete(:label)
        end

        def inject_class_name_to_options
          options[:class] ||= ''
          outline = options[:outline] ? 'outline-' : ''
          active = options[:active] ? ' active' : ''
          options[:class] << " btn btn-#{outline}#{style}#{active}"
        end

        # rubocop:disable Style/DoubleNegation
        def inject_aria_attributes
          options[:aria] ||= {}
          options[:aria][:disabled] = true if options[:disabled]
          options[:aria][:pressed] = !!options[:active]
        end
        # rubocop:enable Style/DoubleNegation

        def inject_data_attributes
          options[:data] ||= {}
          options[:data][:toggle] = 'button' if options.delete(:toggle)
        end

        def html_options
          { type: :submit }.merge(options)
        end

        def parse_options(_)
          super
          inject_additional_attributes
        end
      end
    end
  end
end
