module Bootstrap
  module ViewHelpers
    module Components
      class Card < Component
        def to_html
          content_tag(:div, class: container_options[:class]) do
            concat(header) if options[:title]
            block.call(self) if block.present?
          end
        end

        def header(title = nil)
          return if no_header?(title)
          content_tag(:div, class: 'card-header') do
            concat(yield) if block_given?
            concat(title_tag(title || options[:title])) unless block_given?
          end
        end

        def body(content = nil)
          content_tag(:div, class: 'card-body') do
            concat(yield) if block_given?
            concat(content) unless block_given? || content.present?
          end
        end

        def footer(content = nil)
          content_tag(:div, class: footer_options[:class]) do
            concat(yield) if block_given?
            concat(content) unless block_given? || content.present?
          end
        end

        private

        def no_header?(title)
          title.blank? && options[:title].blank? && !block_given?
        end

        def title_tag(title)
          return title unless header_options[:tag]
          content_tag(header_options[:tag], title,
                      class: header_options[:class])
        end

        def container_options
          default = { class: 'card' }
          default.merge(options)
        end

        def header_options
          default = { class: 'my-0', tag: :h3 }
          default.merge(options[:header] || {})
        end

        def footer_options
          default = { class: 'card-footer' }
          default.merge(options[:body] || {})
        end
      end
    end
  end
end
