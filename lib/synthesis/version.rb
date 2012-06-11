module Synthesis
  module Version
    MAJOR = 0
    MINOR = 3
    RELEASE = 0

    def self.dup
      "#{MAJOR}.#{MINOR}.#{RELEASE}"
    end
  end
end
