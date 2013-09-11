Deface::Override.new(:virtual_path => "monologue/posts/_post",
                     :name => "change_post_display_mode",
                     :replace => "div#content",
                     # :sequence => {:after => "monologue/posts/index" },
                     :partial => "monologue-markdown/overrides/change_post_display_mode")
