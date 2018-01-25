module Bootstrap
  module ViewHelpers
    module Components
      class Accordion < Component
        class Button < Bootstrap::ViewHelpers::Components::Button
          protected

          def inject_aria_attributes
            options[:aria] ||= {}
            options[:aria][:expanded] = expanded?
            options[:aria][:controls] = target
          end

          def inject_data_attributes
            options[:data] ||= {}
            options[:data][:toggle] = 'collapse'
            options[:data][:target] = "##{target}"
          end

          def inject_class_name_to_options
            super
            options[:class] << ' btn-block text-left py-2 px-3'
          end

          def html_options
            options.merge({ type: :button })
          end

          def assign_and_validate_style
            @style = ContextualClasses::LINK
          end

          def target
            @target ||= options.delete(:target)
          end

          # rubocop:disable Style/DoubleNegation
          def expanded?
            @expanded ||= !!options.delete(:expanded)
          end
          # rubocop:enable Style/DoubleNegation

          # rubocop:disable Style/DoubleNegation
          def parse_options(options)
            super
            @target = options.delete(:target)
            @expanded = !!options.delete(:expanded)
          end
          # rubocop:enable Style/DoubleNegation
        end
      end
    end
  end
end
