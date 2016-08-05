#!rackup

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib)

require 'oneetyan/provider'

run Oneetyan::Provider.new
