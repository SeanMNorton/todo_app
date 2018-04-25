require 'rails_helper'

RSpec.describe "lists/show", :type => :view do
  it "displays the list title" do
    assign(:list, List.new(title: "My title", description: "List description"))
    render
     expect(rendered).to include("My title")
  end
end
