require 'test_helper'

class HasStarTest < ActiveSupport::TestCase
  include ActionDispatch::Assertions::RoutingAssertions

  test 'kinds' do
    assert_kind_of Module, HasStar

    assert_kind_of Module, HasStar::ActiveRecord
    assert_kind_of Module, HasStar::ActionController

    assert_kind_of Module, HasStar::Model
    assert_kind_of Module, HasStar::Controller
    assert_kind_of Module, HasStar::Route
    assert_kind_of Module, HasStar::Helper
  end

  test 'mixin' do
    assert_kind_of HasStar::ActiveRecord, ActiveRecord::Base
    assert_kind_of HasStar::ActionController, ActionController::Base
    assert_includes ActionView::Base.ancestors, HasStar::Helper
    assert_includes ActionDispatch::Routing::Mapper.ancestors, HasStar::Route
  end

  test 'respond_to' do
    assert_respond_to Post, :has_star
    assert_respond_to Post, :starred
    assert_respond_to Post, :unstarred
    assert_respond_to Post.new, :toggle_star!
    assert_respond_to PostsController, :has_star
    assert_respond_to PostsController.new, :toggle_star
    assert_respond_to ActionView::Base.new, :toggle_star
  end

  test 'routes' do
    # assert_generates '/posts/1/toggle_star', controller: 'posts', action: 'toggle_star', id: '1'
  end
end
