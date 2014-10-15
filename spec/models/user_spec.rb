require 'rails_helper'
RSpec.describe ApplicationHelper, :type => :helper do

  subject do
    User.new({
      email: "mwdion@gmail.com",
      first_name: "Michael",
      last_name: "Dion",
    })    
  end
   describe "full_name" do
    it "should return the full name of a user object" do
      expect(subject.full_name).to include("Dion")
      expect(subject.full_name).to include("Michael")
    end
    it "should not return empty strings for a user object" do
      expect(subject.full_name).not_to include("Nick")
      expect(subject.full_name).not_to be("")
    end
  end
  it { should have_many(:programs)}
  it { should have_many(:transmits)}
  it { should have_many(:units).through(:programs) }
  it { should have_many(:comments)}


end