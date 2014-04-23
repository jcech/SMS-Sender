require 'spec_helper'

describe Contact do
  it { should have_many :messages }
  it { should belong_to :user }
end
