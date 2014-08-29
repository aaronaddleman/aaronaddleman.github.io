module Jekyll  
  class UltravioletTag < Liquid::Block
    require "textpow"
    require "uv"
    

    include Liquid::StandardFilters

    def initialize(tag_name, markup, tokens)
      super
        processor = Textpow::RecordingProcessor.new
        @options = {}
        if defined?(markup) && markup != ''
          markup.split.each do |opt|
            key, value = opt.split('=')
            @options[key.to_sym] = value || true
          end
        end
        @options[:linenos] = "inline" if @options.key?(:linenos) and @options[:linenos] == true
    end


    def render(context)
      prefix = context["highlighter_prefix"] || ""
      suffix = context["highlighter_suffix"] || ""
      code = super.to_s.strip

      case @options[:file]
      when /.*/
        # we have been passed a file to read
        # set the code variable to read the contents of the
        # passed file
        code = File.read(Dir.pwd + '/' + @options[:file])
      end

      # Uv.syntax_path="/Users/aaddleman/Documents/work/aaronaddleman/public/syntaxes"
      syntax = Textpow.syntax(File.expand_path('assets/files/source.vcl.syntax'))
      processor = Textpow::DebugProcessor.new
      output = Uv.parse(code, "xhtml", @options[:lang], false, "eiffel")      
      rendered_output = add_code_tag(output)
      prefix + rendered_output + suffix
    end

    def render_codehighlighter(code)
      "<div class=\"highlight\"><pre>#{h(code).strip}</pre></div>"
    end

    def add_code_tag(code)
      # Add nested <code> tags to code blocks
      code = code.sub(/<pre>\n*/,'<pre><code class="' + @lang.to_s.gsub("+", "-") + '">')
      code = code.sub(/\n*<\/pre>/,"</code></pre>")
      code.strip
    end

  end
end

Liquid::Template.register_tag('uvhighlight', Jekyll::UltravioletTag)
