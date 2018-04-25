require 'rails_helper'

RSpec.describe List, type: :model do

context "validations" do
  before { @list = List.new(title: "title", description: 'description') }
  it "is valid with title and description" do
    expect(@list).to be_valid
  end
  it "is not valid without a title" do
    @list.title = nil
    expect(@list).to_not be_valid
  end
  it "is valid without a description" do
    @list.description = nil
    expect(@list).to be_valid
  end
end

end
