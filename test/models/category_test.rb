require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(:name => 'sports')
  end

  test "category should be valid" do
    assert @category.valid?, 'category should be valid'
  end

  test "name should be present" do
    @category.name = nil
    assert_not @category.valid?, 'name should be present'
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(:name => 'sports')
    assert_not category2.save, 'name shold be unique'
  end

  test "name should not be too long max 25 characters" do
    @category.name = "c" * 26
    assert_not @category.valid?, 'name should have a maximum of 25 characters'
  end

  test "name should not be too short minimum 3 characters" do
    @category.name = "c" * 2
    assert_not @category.valid?, 'name should have a minimum of 10 characters'
  end

end
