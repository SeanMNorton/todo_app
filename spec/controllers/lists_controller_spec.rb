require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe "GET index" do
      before do
        @lists = [
          List.create(title: 'List Title', description: "description"),
          List.create(title: 'List Title 2', description: "description 2")
        ]
      end
      it "assigns @lists" do
        get :index
        expect(assigns(:lists)).to eq(@lists)
      end
  end


  describe "GET show" do
    before {  @list = List.create(title: 'List Title', description: "description") }
     it "assigns @list" do
       get :show, params:{ id: @list }
       expect(assigns(:list)).to eq(@list)
     end
     it "renders the index template" do
       get :show, params:{ id: @list }
       expect(response).to render_template("show")
     end
   end

   describe "GET new" do
     it "assigns @list" do
       get :new
       expect(assigns(:list)).to be_a_kind_of(List)
     end
   end

end
