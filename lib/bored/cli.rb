module Bored
  class Cli
    def initialize(argv)
      @argv = argv
    end

    def run
      puts Bored.now.description
    end
  end
end
