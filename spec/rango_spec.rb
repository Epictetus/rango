# encoding: utf-8

require_relative "spec_helper"
require "rango"

describe Rango do
  it "should has logger" do
    Rango.logger.should be_kind_of(RubyExts::Logger)
  end

  describe ".boot" do
    # TODO
  end
end
