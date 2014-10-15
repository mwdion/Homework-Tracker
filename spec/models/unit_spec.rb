require 'rails_helper'
RSpec.describe ApplicationHelper, :type => :helper do
subject do
  Unit.new({
      name: "Ruby on Rails",
      date: "2015-01-05",
    })    
  end

  it "should return the name of the unit object" do
    expect(subject.name).to include("Ruby on Rails")
  end
  it "should not return a number for a unit name object" do
    expect(subject.name).not_to include("1234")
  end

  it { should have_many(:projects)}
  it { should have_many(:programs)}
  it { should have_many(:users).through(:programs) }
  it { should belong_to(:location) }






end