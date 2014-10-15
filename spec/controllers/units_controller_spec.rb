require 'rails_helper'
describe UnitsController do
  before (:each) do
    @user = FactoryGirl.create(:user, role: "Campus Director")
    sign_in @user
  end 
let(:location) { Location.create(location_name: "Boston, MA") }
let(:unit) { Unit.create(name: "Ruby on Rails", date: "2015-01-05") }

it 'GET #index' do 
  sign_in
  get :index, location_id: location, id: unit
  expect(assigns(:units).class).to eq(Unit::ActiveRecord_Relation)
end

it 'GET #new' do
  sign_in
  get :new, location_id: location, id: unit
  expect(assigns(:unit).class).to eq(Unit)
  expect(assigns(:unit).new_record?).to eq(true)
end

describe 'POST #create'do
  it 'successful creation' do 
  expect{
  post :create, location_id: location, unit: { name: "Ruby on Rails", date: "2015-01-05"}
  }.to change(Unit, :count).by(1)
  expect(response).to redirect_to location_path(location)
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
      get :edit, location_id: location, id: unit
      expect(assigns(:unit)).to eq(unit)
      expect(assigns(:unit).class).to eq(Unit)
    end
  end

  describe 'GET #show' do 
    it 'should find an object' do
      sign_in
      get :show, location_id: location, id: unit
      expect(assigns(:unit)).to eq(unit)
      expect(assigns(:unit).class).to eq(Unit)
    end
  end

  describe 'PATCH #update' do
    it 'should update an object' do
      patch :update, location_id: location, id: unit, unit: {name: "Ruby on Rails", date: "2015-01-05"}
      expect(assigns(:unit)).to eq(unit)
      expect(assigns(:unit).class).to eq(Unit)
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy an object' do
      expect{
      delete :destroy, location_id: location, id: unit, unit:{name: "Ruby on Rails", date: "2015-01-05"} 
      }.to change(Unit, :count).by(0)
      expect(response).to redirect_to location_path(location)
    end
  end

  
end