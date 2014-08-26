
/*
ScrambledImage050 test
 */

(function() {
  var expect, scrambledImage;

  expect = require('expect.js');

  scrambledImage = require('../bin/ScrambledImage.js');

  describe("ScrambledImage050", function() {
    var simg;
    simg = new scrambledImage.ScrambledImage("/bin/sample.jpg", {
      seed: 1,
      height: 8,
      width: 8
    });
    it("should be defined", function() {
      return expect(simg).to.be.ok();
    });
    return describe("#getShuffleArray_", function() {
      it("should be defined", function() {
        return expect(simg.getShuffleArray_).to.be.ok();
      });
      return it("should return certain shuffled array", function() {
        return expect(simg.getShuffleArray_()).to.eql([61, 25, 62, 33, 26, 16, 45, 59, 27, 36, 9, 6, 46, 44, 18, 13, 34, 32, 55, 42, 40, 12, 43, 35, 28, 52, 48, 50, 20, 53, 14, 0, 24, 8, 31, 15, 47, 7, 38, 54, 63, 23, 37, 49, 11, 4, 57, 3, 58, 60, 21, 1, 30, 39, 10, 56, 2, 29, 22, 5, 51, 17, 19, 41]);
      });
    });
  });

}).call(this);
