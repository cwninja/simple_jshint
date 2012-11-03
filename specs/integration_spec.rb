require "simple_jshint"

describe SimpleJSHint do
  describe "#check" do
    it "reports the errors" do
      result = SimpleJSHint.check("some('dodgy').javascript()\ncode;")
      result.should_not be_ok
      result.should == [
        "Line 1: some('dodgy').javascript() : Error Missing semicolon.",
        "Line 2: code; : Error Expected an assignment or function call and"+
          " instead saw an expression."
      ]
    end

    it "handles the fixed up JS just fine" do
      result = SimpleJSHint.check("some('not so dodgy').javascript();\ncode();")
      result.should be_ok
      result.should == [ ]
    end
  end
end
