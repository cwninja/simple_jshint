require "simple_jshint/version"
require "execjs"
require "multi_json"

module SimpleJSHint
  class Result < Array
    alias ok? empty?

    def initialize(errors)
      super errors.map{|error|
        if error.nil?
          "A fatal error occurred"
        else
          "Line %i: %s : Error %s" % error.values_at("line", "evidence", "reason")
        end
      }
    end

    def inspect
      ok? ? "[OK]" : super
    end
  end

  def self.check(code)
    jshint = File.expand_path('../../vendor/jshint.js', __FILE__)

    env = ExecJS.compile %{
      #{File.read(jshint)}
      function process(code){
        JSHINT(code);
        return JSHINT.errors;
      }
    }

    Result.new(env.call('process', code))
  end
end
