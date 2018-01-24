module Bootstrap
  module ViewHelpers
    module Components
      class Accordion < Component
        class Card < Bootstrap::ViewHelpers::Components::Card
          def header(_ = nil, _ = {})
            content_tag(:div, class: "card-header p-0 #{options[:class]}",
                        id: header_id) do
              title_tag(options[:title])
            end
          end

          def body(_ = nil, &block)
            content_tag(:div, collapse_options) do
              content_tag(:div, class: body_class(options)) do
                block.call
              end
            end
          end

          protected

          attr_reader :id

          def title_tag(title)
            content_tag(:h5, class: header_options[:class]) do
              Button.new(view, { label: title, target: accordion_item_id,
                                 expanded: options[:expanded] }).to_html
            end
          end

          def header_id
            return @header_id if defined? @header_id
            random_id = "header_#{SecureRandom.urlsafe_base64}"
            @header_id = options[:header_id] || random_id
          end

          def accordion_item_id
            @id ||= options[:id] || "group_#{SecureRandom.urlsafe_base64}"
          end

          def collapse_options
            { class: "collapse #{'show' if options[:expanded]}",
              id: accordion_item_id, data: { parent: "##{options[:parent]}" },
              aria: { labelled_by: header_id } }
          end
        end
      end
    end
  end
end
