require 'rails_helper'

RSpec.describe "routing to lists", :type => :routing do

  it "routes /lists to list#index" do
    expect(:get => "/lists").to route_to(
      :controller => "lists",
      :action => "index"
    )
  end

  it "routes /lists/:id to list#show" do
    @list = List.new(title: "This is the title", description: "description")
    @list.save
    expect(:get => "/lists/#{@list.id}").to route_to(
      :controller => "lists",
      :action => "show",
      :id => "#{@list.id}"
    )
  end

  it "routes /lists/new to list#new" do
    expect(:get => "/lists/new").to route_to(
      :controller => "lists",
      :action => "new",
    )
  end
end
