#
# Copyright:: Copyright 2018, Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "spec_helper"

describe Chef::Resource::SwapFile do
  let(:resource) { Chef::Resource::SwapFile.new("swapfile") }

  it "sets resource name as :swap_file" do
    expect(resource.resource_name).to eql(:swap_file)
  end

  it "sets the path as its name" do
    expect(resource.path).to eql("swapfile")
  end

  it "sets the default action as :create" do
    expect(resource.action).to eql([:create])
  end

  it "supports :create and :remove actions" do
    expect { resource.action :create }.not_to raise_error
    expect { resource.action :remove }.not_to raise_error
    expect { resource.action :delete }.to raise_error(ArgumentError)
  end
end
