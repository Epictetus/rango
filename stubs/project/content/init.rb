#!/usr/bin/env ruby1.9
# encoding: utf-8

require "rango"

# === Usage === #
# init.rb
# init.rb production
Rango.boot(environment: ARGV.shift)

# dependencies
# Rango.dependency "dm-core", github: "datamapper/dm-core"
# Rango.dependency "pupu", github: "botanicus/pupu", as: "pupu/adapters/rango"
Rango.dependency "haml", github: "nex3/haml"

# === Setup your paths === #
# if Dir.exist?("gems")
#   Gem.path.clear
#   Gem.path.push(Project.path.join("gems").to_s)
# end

if Dir.exist?("vendor")
  $:.unshift(File.expand_path("vendor"))
end

require_relative "settings"

# environment support
env_file = "settings/environments/#{Rango.environment}"
if File.exist?(env_file)
  require_relative env_file
else
  abort "File #{env_file} doesn't exist!"
end

# database connection
# DataMapper.setup(:default, "sqlite3::memory")

# if you will run this script with -i argument, interactive session will begin
Rango.interactive if ARGV.delete("-i")
