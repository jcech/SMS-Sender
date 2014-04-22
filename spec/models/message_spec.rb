require 'spec_helper'

describe Message do
  it { should belong_to :user }
  it { should have_many :recipients }
  it { should have_many :contacts }
end
