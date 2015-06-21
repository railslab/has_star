require 'test_helper'
require 'generators/has_star/has_star_generator'

class HasStarGeneratorTest < Rails::Generators::TestCase
  tests HasStarGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  test 'generator runs without errors' do
    assert_nothing_raised do
      run_generator ['has_star post']
    end
  end
end
