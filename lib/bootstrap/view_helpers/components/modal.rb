require_relative 'button'
require_relative 'button/close'
require_relative 'modal/body'
require_relative 'modal/footer'
require_relative 'modal/header'

module Bootstrap
  module ViewHelpers
    module Components
      class Modal < Component
        def to_html
          content_tag(:div, modal_options) do
            content_tag(:div, dialog_options) do
              content_tag(:div, content_options) { content_to_html(&block) }
            end
          end
        end

        def header(title_or_options = nil, header_options = {}, &block)
          header_options = title_or_options || {} if block.present?
          title_or_options = nil if block.blank?
          header_options[:title] ||= title_or_options || title_text
          header_options[:dismiss] ||= dismiss
          Header.new(view, header_options, &block).to_html
        end

        def body(body_options = {}, &block)
          Body.new(view, body_options, &block).to_html
        end

        def footer(footer_options = {}, &block)
          Footer.new(view, footer_options, &block).to_html
        end

        protected

        attr_reader :title_text, :centered, :dismiss, :fade, :show, :size

        def content_to_html(&block)
          capture do
            concat(header) if title_text
            concat(body(&block)) if render_body?
            yield(self) if block.present? && !render_body?
          end
        end

        def random_uid
          SecureRandom.urlsafe_base64
        end

        def dialog_options
          class_name = "modal-dialog#{' modal-dialog-centered' if centered}"
          { class: class_name, role: 'document' }
        end

        def content_options
          { class: 'modal-content' }
        end

        def modal_options
          defaults = { id: "modal_#{random_uid}", tabindex: -1, role: 'dialog' }
          defaults.merge(options)
        end

        def header_options
          { tag: :h5, class: 'modal-title' }
        end

        def render_body?
          @render_body ||= options.delete(:body)
        end

        def inject_class_name_to_options
          options[:class] = "#{options[:class]} modal#{fade}#{show}"
          options[:class] << " modal-#{size}" if size.present?
          options[:class].strip!
        end

        def parse_html_options
          @centered = options.delete(:centered)
          @dismiss = options.delete(:dismiss)
          @fade = ' fade' if options[:fade].nil? || options.delete(:fade)
          @show = ' show' if options.delete(:show)
          @size = options.delete(:size)
        end

        def parse_options(options)
          super
          @title_text = options.delete(:title)
          parse_html_options
          inject_class_name_to_options
        end
      end
    end
  end
end
