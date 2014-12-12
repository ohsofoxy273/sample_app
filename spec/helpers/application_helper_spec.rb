require 'spec_helper'

describe ApplicationHelper do
	describe "#full_title" do 
		it "Returns the base title if the page title is empty" do
			page_title = ""
			expect(full_title(page_title)).to eq("Ruby on Rails Tutorial Sample App")
		end

		it "returns page title | base_title if page title is not empty" do
			page_title = "About"
			expect(full_title(page_title)).to eq("About | Ruby on Rails Tutorial Sample App")
		end
	end
end