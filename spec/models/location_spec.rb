require 'rails_helper'
RSpec.describe ApplicationHelper, :type => :helper do
subject do
  Location.new({
                location_name: "Boston, MA"
    })
end

it "should have a name attribute" do
  expect(subject.location_name).to include("Boston, MA")
end
  
describe location do
  it { should have_many(:units)}
end

   

end