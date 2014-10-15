require 'rails_helper'
describe LocationsController do 
  before (:each) do
    @user = FactoryGirl.create(:user, role: "Campus Director")
    sign_in @user
  end
  let(:location) { Location.create(location_name: "Boston, MA") }

  it 'GET #index' do 
    sign_in
    get :index
    expect(assigns(:locations).class).to eq(Location::ActiveRecord_Relation)
  end

  it 'GET #new' do
    sign_in
    get :new
    expect(assigns(:location).class).to eq(Location)
    expect(assigns(:location).new_record?).to eq(true)
  end

  describe 'POST #create'do
    it 'successful creation' do 
      expect{
        post :create, location: { location_name: "Boston, MA"}
      }.to change(Location, :count).by(1)
      expect(response).to redirect_to locations_path
    end
  end

  # it "failed creation" do
  #     expect {
  #       post :create, location: { name: "" }
  #     }.not_to change(Location, :count)
  #     expect(response).to render_template :new
  #   end

  describe 'GET #edit' do
    it 'should find an object' do 
      sign_in
      get :edit, id: location
      expect(assigns(:location)).to eq(location)
      expect(assigns(:location).class).to eq(Location)
    end
  end

  describe 'GET #show' do 
    it 'should find an object' do
      sign_in
      get :show, id: location
      expect(assigns(:location)).to eq(location)
      expect(assigns(:location).class).to eq(Location)
    end
  end

  describe 'PATCH #update' do
    it 'should update an object' do
      patch :update, id: location, location: { location_name: "New York, NY"}
      expect(assigns(:location)).to eq(location)
      expect(assigns(:location).class).to eq(Location)
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy an object' do
    expect{
    delete :destroy, id: location, location:{ location_name: "Boston, MA"} 
    }.to change(Location, :count).by(0)
    expect(response).to redirect_to locations_path
  end
end
end
