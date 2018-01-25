module Bootstrap
  module ViewHelpers
    module Components
      class Modal < Component
        class Header < Component
          def to_html
            content_tag(:div, class: 'modal-header') do
              concat(block.call(self)) if block.present?
              concat title if block.blank?
              concat close_button if dismiss
            end
          end

          def title(title = nil)
            title ||= title_text
            return title unless title_options[:tag]
            content_tag(title_options[:tag], title,
                        class: title_options[:class])
          end

          def close_button
            Button::Close.new(view, {}).to_html
          end

          protected

          attr_reader :title_text, :dismiss

          def title_options
            { tag: :h5, class: 'modal-title' }
          end

          def inject_class_name_to_options
            options[:class] = "modal-header #{options[:class]}"
            options[:class].strip!
          end

          def parse_options(options)
            super
            @title_text = options.delete(:title)
            @dismiss = options.delete(:dismiss)
            inject_class_name_to_options
          end
        end
      end
    end
  end
end
