require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test 'that the status requires content to be valid' do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
  end

  test 'that the content is at least to letters long' do
    status = Status.new
    status.content = "H"
    assert !status.save
    assert !status.errors[:content].empty?
  end
end
