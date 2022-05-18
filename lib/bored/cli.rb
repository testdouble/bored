require "optparse"

module Bored
  class Cli
    def initialize(argv)
      @argv = argv
    end

    def run
      puts Bored.now(**params).description
    end

    private

    def params
      options = {}
      OptionParser.new do |opts|
        opts.on("--type TYPE", "Pick the type of activity") do |t|
          options[:type] = t
        end
      end.parse!
      options
    end
  end
end
