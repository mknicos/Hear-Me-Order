require 'spec_helper'

describe User do
  it {should validate_uniquness_of :username }
end
