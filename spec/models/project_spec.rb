require 'rails_helper'
RSpec.describe ApplicationHelper, :type => :helper do
subject do
  Project.new({
                name: "Carlot 8"
    })
end

it "should return the name of the project object" do
  expect(subject.name).to include("Carlot 8")
end

it "should not return an empty string for a project name object" do
  expect(subject.name).not_to be("")
end

  it { should have_many(:transmits)}
  it { should belong_to(:unit) }



end