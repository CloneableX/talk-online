require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RoomsHelper. For example:
#
# describe RoomsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RoomsHelper, type: :helper do
  it 'should generate javascript tag when file exists' do
    javascript_tag = helper.javascript_pack_tag_if_exists('application', 'data-turbolinks-track': 'reload')
    expect(javascript_tag).to be_present
  end

  it 'should not generate javascript tag when file is not exists' do
    javascript_tag = helper.javascript_pack_tag_if_exists('not_exist_file', 'data-turbolinks-track': 'reload')
    expect(javascript_tag).to be_blank
  end
end
