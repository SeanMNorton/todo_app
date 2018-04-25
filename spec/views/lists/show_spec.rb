require 'rails_helper'

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
