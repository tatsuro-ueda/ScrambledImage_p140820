
/*
ScrambledImage050 test
 */

(function() {
  var ScrambledImage, expect;

  expect = require('expect.js');

  ScrambledImage = require('../bin/ScrambledImage.js');

  describe("ScrambledImage050", function() {
    var simg;
    simg = new ScrambledImage.ScrambledImage("/bin/sample.jpg", {
      seed: 1,
      height: 8,
      width: 8
    });
    return describe("#putShuffleArray_", function() {
      return it("should return certain shuffled array", function() {
        return expect(simg.putShuffleArray_()).to.eql([6, 63, 51, 60, 36, 45, 11, 49, 31, 44, 46, 57, 34, 50, 25, 17, 27, 33, 40, 61, 3, 8, 2, 14, 55, 5, 37, 23, 10, 41, 1, 22, 56, 16, 9, 39, 26, 43, 53, 12, 0, 18, 24, 59, 62, 19, 42, 54, 48, 13, 35, 30, 38, 20, 47, 4, 29, 7, 15, 32, 52, 28, 21, 58]);
      });
    });
  });

}).call(this);
