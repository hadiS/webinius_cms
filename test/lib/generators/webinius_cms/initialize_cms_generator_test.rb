require 'test_helper'
require 'generators/initialize_cms/initialize_cms_generator'

module WebiniusCms
  class InitializeCmsGeneratorTest < Rails::Generators::TestCase
    tests InitializeCmsGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
