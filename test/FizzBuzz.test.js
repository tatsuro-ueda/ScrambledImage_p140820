(function() {
  var expect, scrambledImage;

  expect = require('expect.js');

  scrambledImage = require('../bin/ScrambledImage.js');

  describe("FizzBuzz", function() {
    var f;
    f = new scrambledImage.FizzBuzz;
    return it("returns Fizz when 3 is given", function() {
      var result;
      result = f.returnString(3);
      return expect(result).to.be("Fizz");
    });
  });

}).call(this);
