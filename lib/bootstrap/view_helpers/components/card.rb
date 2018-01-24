module Bootstrap
  module ViewHelpers
    module Components
      class Card < Component
        def to_html
          content_tag(:div, class: container_options[:class]) do
            concat(header) if options[:title]
            concat(body(&block)) if options[:body]
            block.call(self) if block.present? && !options[:body]
          end
        end

        def header(title_or_opts = nil, opts = {})
          opts = title_or_opts if title_or_opts.is_a? Hash
          opts[:title] = title_or_opts if title_or_opts.is_a? String
          return if no_header?(opts[:title], block_given?)
          content_tag(:div, class: "card-header #{opts[:class]}") do
            yield if block_given?
            concat(title_tag(opts[:title])) unless block_given?
          end
        end

        def body(content_or_options = nil)
          opts = content_or_options.is_a?(Hash) ? content_or_options : {}
          content = content_or_options.is_a?(String) ? content_or_options : nil
          content_tag(:div, class: body_class(opts)) do
            yield if block_given?
            concat(content) if content.present?
          end
        end

        def footer(content = nil, opts = {})
          opts, content = content, nil if content.is_a? Hash
          content_tag(:div, class: "card-footer #{opts[:class]}") do
            yield if block_given?
            concat(content) unless block_given? || content.present?
          end
        end

        private

        def parse_options(options)
          super(options)
          options[:body] = {} if options[:body].is_a?(TrueClass)
        end

        def assign_and_validate_style; end

        def no_header?(title, has_block)
          title.blank? && options[:title].blank? && !has_block
        end

        def title_tag(title)
          title = title || options[:title]
          return title unless header_options[:tag]
          content_tag(header_options[:tag], title,
                      class: header_options[:class])
        end

        def container_options
          default = { class: 'card ' }
          default[:class] << options.delete(:class).to_s
          default.merge(options)
        end

        def header_options
          default = { class: 'my-0', tag: :h5 }
          default.merge(options[:header] || {})
        end

        def body_class(opts)
          classes = ['card-body']
          classes << (options[:body] || {}).delete(:class)
          classes << (opts || {}).delete(:class)
          classes.compact.join(' ')
        end

        def footer_options
          default = { class: 'card-footer' }
          default.merge(options[:footer] || {})
        end
      end
    end
  end
end
