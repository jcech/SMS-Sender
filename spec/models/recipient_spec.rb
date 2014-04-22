require 'spec_helper'

describe Recipient do
  it { should belong_to :message }
  it { should belong_to :contact }
end
