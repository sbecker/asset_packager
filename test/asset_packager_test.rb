# frozen_string_literal: true

require_relative "test_helper"

class AssetPackagerTest < ActionController::TestCase
  include Synthesis

  def setup
    Synthesis::AssetPackage.stubs(:asset_base_path).returns("./test/assets")
    Synthesis::AssetPackage.stubs(:asset_packages_yml).returns(YAML.load_file("./test/asset_packages.yml"))

    Synthesis::AssetPackage.any_instance.stubs(:log)
    Synthesis::AssetPackage.build_all
  end

  def teardown
    Synthesis::AssetPackage.delete_all
  end

  def test_find_by_type
    js_asset_packages = Synthesis::AssetPackage.find_by(type: "javascripts")
    assert_equal 2, js_asset_packages.length
    assert_equal "base", js_asset_packages[0].target
    assert_equal %w[prototype effects controls dragdrop], js_asset_packages[0].sources
  end

  def test_find_by_target
    package = Synthesis::AssetPackage.find_by_target("javascripts", "base")
    assert_equal "base", package.target
    assert_equal %w[prototype effects controls dragdrop], package.sources
  end

  def test_find_by_source
    package = Synthesis::AssetPackage.find_by_source("javascripts", "controls")
    assert_equal "base", package.target
    assert_equal %w[prototype effects controls dragdrop], package.sources
  end

  def test_delete_and_build
    Synthesis::AssetPackage.delete_all
    js_package_names = Dir.new("#{Synthesis::AssetPackage.asset_base_path}/javascripts").entries.delete_if do |x|
      x !~ /\A\w+_packaged.js/
    end
    css_package_names = Dir.new("#{Synthesis::AssetPackage.asset_base_path}/stylesheets").entries.delete_if do |x|
      x !~ /\A\w+_packaged.css/
    end
    css_subdir_package_names = Dir.new("#{Synthesis::AssetPackage.asset_base_path}/stylesheets/subdir").entries.delete_if do |x|
      x !~ /\A\w+_packaged.css/
    end

    assert_equal 0, js_package_names.length
    assert_equal 0, css_package_names.length
    assert_equal 0, css_subdir_package_names.length

    Synthesis::AssetPackage.build_all
    js_package_names = Dir.new("#{Synthesis::AssetPackage.asset_base_path}/javascripts").entries.delete_if do |x|
      x !~ /\A\w+_packaged.js/
    end.sort
    css_package_names = Dir.new("#{Synthesis::AssetPackage.asset_base_path}/stylesheets").entries.delete_if do |x|
      x !~ /\A\w+_packaged.css/
    end.sort
    css_subdir_package_names = Dir.new("#{Synthesis::AssetPackage.asset_base_path}/stylesheets/subdir").entries.delete_if do |x|
      x !~ /\A\w+_packaged.css/
    end.sort

    assert_equal 2, js_package_names.length
    assert_equal 2, css_package_names.length
    assert_equal 1, css_subdir_package_names.length
    assert_match(/\Abase_packaged.js\z/, js_package_names[0])
    assert_match(/\Asecondary_packaged.js\z/, js_package_names[1])
    assert_match(/\Abase_packaged.css\z/, css_package_names[0])
    assert_match(/\Asecondary_packaged.css\z/, css_package_names[1])
    assert_match(/\Astyles_packaged.css\z/, css_subdir_package_names[0])
  end

  def test_js_names_from_sources
    package_names = Synthesis::AssetPackage.targets_from_sources("javascripts",
                                                                 %w[prototype effects noexist1 controls foo noexist2])
    assert_equal 4, package_names.length
    assert_match(/\Abase_packaged\z/, package_names[0])
    assert_equal("noexist1", package_names[1])
    assert_match(/\Asecondary_packaged\z/, package_names[2])
    assert_equal("noexist2", package_names[3])
  end

  def test_css_names_from_sources
    package_names = Synthesis::AssetPackage.targets_from_sources("stylesheets",
                                                                 %w[header screen noexist1 foo noexist2])
    assert_equal 4, package_names.length
    assert_match(/\Abase_packaged\z/, package_names[0])
    assert_equal("noexist1", package_names[1])
    assert_match(/\Asecondary_packaged\z/, package_names[2])
    assert_equal("noexist2", package_names[3])
  end

  def test_should_return_merge_environments_when_set
    Synthesis::AssetPackage.merge_environments = %w[staging production]
    assert_equal %w[staging production], Synthesis::AssetPackage.merge_environments
  end

  def test_should_only_return_production_merge_environment_when_not_set
    Synthesis::AssetPackage.merge_environments = nil
    assert_equal ["production"], Synthesis::AssetPackage.merge_environments
  end
end
