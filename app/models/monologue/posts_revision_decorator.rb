Monologue::PostsRevision.class_eval do
  before_validation do
    if self.post.nil? || self.post.posts_revision_id.nil?
      self.is_markdown = true
    else
      self.is_markdown = self.post.active_revision.is_markdown
    end
  end

  def is_markdown?
    self.is_markdown != false
  end

  def content
    if self.is_markdown? && !in_admin?(caller)
      rnd = MonologueMarkdown::HelloLight.new(
        :filter_html => true, 
        :hard_wrap => true)
      options = {
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :autolink => true,
        :strikethrough => true,
        :lax_html_blocks => true,
        :superscript => true
      }
      return Redcarpet::Markdown.new(rnd, options).render(read_attribute(:content)).html_safe
    else
      read_attribute(:content)
    end
  end

  def in_admin? caller
    caller.each do |c|
      return true if c.include? "app/controllers/monologue/admin/posts_controller.rb"
    end
    return false
  end
end