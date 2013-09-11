Deface::Override.new(:virtual_path => "monologue/posts/post",
                     :name => "change_post_display_mode",
                     :replace => "div.content",
                     :partial => "monologue-markdown/overrides/change_post_display_mode")
