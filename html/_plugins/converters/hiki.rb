require 'hikidoc'

module Jekyll
  class HikiConverter < Converter
    safe true

    def setup
    end

    def matches(ext)
      /wiki/i =~ ext
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      snippet = HikiDoc.to_html(content, :use_wiki_name => false)
      snippet = "<section class=\"contents\">\n#{snippet}\n</section>"
      snippet = "<div class=\"main\">\n#{snippet}\n</div>"
      snippet
    end
  end
end
