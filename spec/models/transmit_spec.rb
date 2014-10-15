require 'rails_helper'
RSpec.describe ApplicationHelper, :type => :helper do
subject do
  Transmit.new({
                name: "HWTracker Assignment",
                github_link: "www.github.com"
    })
end
  it "should return the name of the project object" do
    expect(subject.name).to include("HWTracker Assignment")
  end
  it "should not return an empty string for a project name object" do
    expect(subject.name).not_to be("")
  end
  it "should return the github link of the project object" do
    expect(subject.github_link).to include("www.github.com")
  end
  it "should not return an empty string for a project github link object" do
    expect(subject.github_link).not_to be("")
  end

end