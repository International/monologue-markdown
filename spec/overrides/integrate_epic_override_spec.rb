require "spec_helper"
require "pry"

describe "InsertEPICEditorInAdmin" do
  include Deface::TemplateHelper

  it "should work" do
    before = load_template_source("layouts/monologue/admin", false, false).dup

    after = load_template_source("layouts/monologue/admin", false, true).dup

    doc = Deface::Parser.convert(after)

    head_node = doc.at_css("head")
    nodes = head_node.children.select {|e| e.name == "erb"}.map(&:children).map(&:text)

    nodes.find {|e| e =~ /stylesheet_link_tag\s+\"monologue\/admin\/application\"/}.should_not be_nil
    nodes.find {|e| e =~ /stylesheet_link_tag\s+\"monologue-markdown\/application\"/}.should_not be_nil    

    nodes.find {|e| e =~ /csrf_meta_tags/}.should_not be_nil
    nodes.find {|e| e =~ /javascript_include_tag\s+\"monologue\/admin\/application\"/}.should_not be_nil
    nodes.find {|e| e =~ /javascript_include_tag\s+\"monologue-markdown\/application\"/}.should_not be_nil    
  end
end