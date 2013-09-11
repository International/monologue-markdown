module MonologueMarkdown
  class HelloLight < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      # Rails.cache.fetch ["code", language, sha].join('-') do
        # Pygments.highlight(code, lexer: language).html_safe
        CodeRay.scan(code.gsub(/&nbsp;/i," "), language).div(:line_numbers => :table)
      # end
    end
  end
end
