Deface::Override.new(:virtual_path => "layouts/monologue/application",
                     :name => "insert_coderay_assets_in_layout",
                     :insert_bottom => "head",
                     :partial => "monologue-markdown/overrides/assets")
