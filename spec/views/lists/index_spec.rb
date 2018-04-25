require 'rails_helper'

RSpec.describe "lists/index", :type => :view do
  it "renders hello world" do
    render
     expect(rendered).to include("Hello World")
  end
end
