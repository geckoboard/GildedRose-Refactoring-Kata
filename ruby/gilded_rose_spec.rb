require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rspec', '~> 3'
  gem 'simplecov' if ENV["COVERAGE"]
end

require "rspec/autorun"
SimpleCov.start do
  enable_coverage :branch

end if ENV["COVERAGE"]

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

end
