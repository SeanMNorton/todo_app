require 'rails_helper'

RSpec.describe "lists/index", :type => :view do
  it "renders hello world" do
    render
    expect(rendered).to include("Hello World")
  end
end


RSpec.describe "lists/show", :type => :view do
  before do
    assign(:list, List.new(title: "My title", description: "List description"))
  end
  it "displays the list title" do
    render
    expect(rendered).to include("My title")
  end
  it "displays the list description" do
    render
    expect(rendered).to include("List description")
  end
end


RSpec.describe "lists/new", :type => :view do
  before { assign(:list, List.new()) }
  it "list form partial" do
    render
    expect(rendered).to include("Title")
  end
end
