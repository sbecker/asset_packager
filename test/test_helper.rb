require 'rubygems'

`rm -rf test/fake_root`
`mkdir -p test/fake_root/tmp`

class Rails
  def self.root
    File.expand_path("test/fake_root")
  end
end

require 'action_view'

$LOAD_PATH << 'lib'
require 'init'

require 'test/unit'
require 'mocha'
