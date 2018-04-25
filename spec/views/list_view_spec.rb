require 'rails_helper'

RSpec.describe "lists/index", :type => :view do
  before do
    assign(:lists, [
      List.create(title: 'List Title', description: "description"),
      List.create(title: 'List Title 2', description: "description 2")
      ])
  end
  it "renders all list titles" do
    render
    expect(rendered).to include("List Title")
    expect(rendered).to include("List Title 2")
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
  it "displays list form partial" do
    render
    expect(rendered).to include("Title")
  end
  it "displays New List" do
    render
    expect(rendered).to include("New List")
  end
end


RSpec.describe "lists/edit", :type => :view do
  before do
    list = List.new(title: "Title", description: "Description")
    assign(:list, list)
  end
  it "displays list form partial" do
    render
    expect(rendered).to render_template('lists/_form')
  end
  it "displays New List" do
    render
    expect(rendered).to include("Edit List")
  end
end
