require 'test_helper'

class HasStarTest < ActiveSupport::TestCase
  include ActionDispatch::Assertions::RoutingAssertions

  test "declarations" do
    assert_kind_of Module, HasStar
    assert_kind_of Module, HasStar::Model
    assert_includes ActiveRecord::Base.singleton_class.ancestors, HasStar
    assert_respond_to Post, :has_star
    assert_respond_to Post, :with_star
    assert_respond_to Post, :without_star
    assert_respond_to Post.new, :toggle_star!
    assert_respond_to PostController, :has_star
    assert_respond_to PostController.new, :toggle_star
    assert_respond_to ActionView::Base.new, :toggle_star
  end

  test "routes" do
    assert_generates '/post/1/toggle_star', { controller: 'post', action: 'toggle_star', id: '1' }
  end
end
