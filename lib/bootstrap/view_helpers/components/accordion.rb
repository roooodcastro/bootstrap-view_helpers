require_relative 'button'
require_relative 'card'
require_relative 'accordion/button'
require_relative 'accordion/card'

module Bootstrap
  module ViewHelpers
    module Components
      class Accordion < Component
        def to_html
          content_tag(:div, id: accordion_id) do
            block.call(self)
          end
        end

        def group(title, options = {}, &block)
          options[:title] = title
          options[:body] = true
          options[:parent] = accordion_id
          Card.new(view, options, &block).to_html
        end

        protected

        def accordion_id
          @id ||= options[:id] || "accordion_#{random_uid}"
        end

        def random_uid
          SecureRandom.urlsafe_base64
        end

        def assign_and_validate_style
          @style = ContextualClasses::LINK
        end

        def inject_aria_attributes(opts)
          opts[:aria] ||= {}
          opts[:aria][:controls] = ''
          opts[:aria][:expanded] = false
        end
      end
    end
  end
end