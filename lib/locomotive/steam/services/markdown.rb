require 'redcarpet'

module Locomotive
  module Steam
    module Services
      class Markdown

        def render(text)
          self.class.parser.render(text)
        end

        def self.parser
          @@markdown ||= Redcarpet::Markdown.new Redcarpet::Steam::HTML, {
            autolink:         true,
            fenced_code:      true,
            generate_toc:     true,
            gh_blockcode:     true,
            hard_wrap:        true,
            no_intraemphasis: true,
            strikethrough:    true,
            tables:           true,
            xhtml:            true
          }
        end

      end
    end
  end
end