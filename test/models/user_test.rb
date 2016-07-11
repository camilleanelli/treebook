require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "a user should have a profile name whithout spaces" do
    user = User.new
    user.pseudoname = "pseudoname with spaces"

    assert !user.save
    assert !user.errors[:pseudoname].empty?
    assert user.errors[:pseudoname].include?("Ne doit pas contenir d'espace")

  end

end
