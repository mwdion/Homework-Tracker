require 'rails_helper'
describe ProjectsController do
  before (:each) do
    @user = FactoryGirl.create(:user, role: "Campus Director")
    sign_in @user
  end 
let(:location) { Location.create(location_name: "Boston, MA") }
let(:unit) { Unit.create(name: "Ruby on Rails", date: "2015-01-05") }
let(:project) { Project.create(name: "HWTracker", date: "2015-02-21", description: "Create an Iron Yard specific homework tracker", requirements: "Use AJAX, User Authentication, and Rails") }

it 'GET #index' do 
  sign_in
  get :index, location_id: location, unit_id: unit, id: project
  expect(assigns(:projects).class).to eq(Project::ActiveRecord_Relation)
end

it 'GET #new' do
  sign_in
  get :new, location_id: location, unit_id: unit, id: project
  expect(assigns(:project).class).to eq(Project)
  expect(assigns(:project).new_record?).to eq(true)
end

describe 'POST #create'do
  it 'successful creation' do
  expect{
  post :create, location_id: location, unit_id: unit, project: { name: "HWTracker", date: "2015-02-21", description: "Create an Iron Yard specific homework tracker", requirements: "Use AJAX, User Authentication, and Rails"}
  }.to change(Project, :count).by(1)
  expect(response).to redirect_to location_unit_path(location, unit)
  end
end

# it "failed creation" do
#       expect {
#         post :create, location: { name: "" }
#       }.not_to change(Location, :count)
#       expect(response).to render_template :new
#     end


describe 'GET #edit' do
    it 'should find an object' do
      sign_in
      get :edit, location_id: location, unit_id: unit, id: project
      expect(assigns(:project)).to eq(project)
      expect(assigns(:project).class).to eq(Project)
    end
  end

 describe 'GET #show' do
    it 'should find an object' do
      sign_in
      get :show, location_id: location, unit_id: unit, id: project
      expect(assigns(:project)).to eq(project)
      expect(assigns(:project).class).to eq(Project)
    end
  end


 describe 'PATCH #update' do
    it 'should update an object' do
      patch :update, location_id: location, unit_id: unit, id: project, project:{ name: "HWTracker", date: "2015-02-21", description: "Create an Iron Yard specific homework tracker", requirements: "Use AJAX, User Authentication, and Rails"}
      expect(assigns(:project)).to eq(project)
      expect(assigns(:project).class).to eq(Project)
    end
  end


describe 'DELETE #destroy' do
    it 'should destroy an object' do
      expect{
      delete :destroy, location_id: location, unit_id: unit, id: project, project:{ name: "HWTracker", date: "2015-02-21", description: "Create an Iron Yard specific homework tracker", requirements: "Use AJAX, User Authentication, and Rails"}
      }.to change(Project, :count).by(0)
      expect(response).to redirect_to location_unit_path(location, unit)
    end
  end
end