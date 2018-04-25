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

   describe "GET create" do
     before { @list_params = {title: 'List Title', description: "description"} }
     it "assigns @list" do
       post :create, params:{ list: @list_params }
       expect(assigns(:list)).to be_a_kind_of(List)
     end
     it "redirects to show on save" do
       post :create, params:{ list: @list_params }
        expect(response).to redirect_to :action => :show, :id => assigns(:list).id
     end
     it "renders new if it can not save" do
       post :create, params:{ list:{title: nil, description: "some text"} }
       expect(response).to render_template('new')
     end
   end

   describe "DELETE destroy" do
     before do
       @list = List.create(title: 'List Title', description: "description")
     end
     it "deletes list from database" do
       list_count = List.count
       post :destroy, params:{id: @list.id}
       expect(List.count).to eq(list_count - 1)
     end
     it "redirects to list index" do
        post :destroy, params:{id: @list.id}
        expect(response).to redirect_to :action => :index
     end
   end

   describe "GET Edit" do

   end

end
