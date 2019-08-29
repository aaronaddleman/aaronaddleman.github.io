module Jekyll
  module Toc
    def toc(input)
      output = "<ul class=\"section table-of-contents\">"
      h4s = 0
      input.scan(/<(h[3-4])(?:>|\s+(.*?)>)([^<]*)<\/\1\s*>/mi).each do |entry|
        id = (entry[1][/^id=(['"])(.*)\1$/, 2] rescue nil)
        title = entry[2].gsub(/<(\w*).*?>(.*?)<\/\1\s*>/m, '\2').strip
        href = title.downcase.gsub(' ', '-')
        heading = entry[0].strip
        case heading
        when 'h3'
          if h4s > 0
            output << '</ul>'
            h4s = 0
          end
          output << %{<li><a href="##{href}" entry="#{entry.inspect}">#{title}</a></li>}
        when 'h4'
          if h4s == 0
            output << '<ul>'
            h4s += 1
          end

          if h4s > 0
            output << %{<li><a href="##{href}" entry="#{entry.inspect}">#{title}</a></li>}
            h4s += 1
          end
        end
      end
      output << '</ul>'
      output
    end
  end
end

Liquid::Template.register_filter(Jekyll::Toc)
