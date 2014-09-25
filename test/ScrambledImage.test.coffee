###
ScrambledImage050 test
###

expect = require 'expect.js'
ScrambledImage = require '../bin/ScrambledImage.js'

describe "ScrambledImage050", ->

    simg = new ScrambledImage.ScrambledImage( "/bin/sample.jpg",
        { seed: "todo"
        height: 8
        width: 8 }
    )

    it "should be defined", ->
    	expect( simg ).to.be.ok()

    describe "#getShuffleArray_", ->
        it "should be defined", ->
            expect( simg.getShuffleArray_ ).to.be.ok()
        it "should return certain shuffled array", ->
            expect( simg.getShuffleArray_() ).to.eql(
                [ 63, 61, 32, 59, 55, 57, 33, 54, 49, 48, 2, 9, 3, 13, 46, 6, 21, 27, 40, 8, 47, 29, 39, 23, 25, 12, 28, 5, 15, 26, 51, 38, 30, 24, 31, 34, 17, 10, 19, 22, 35, 14, 37, 7, 41, 44, 11, 1, 20, 43, 45, 4, 16, 36, 18, 52, 0, 42, 53, 58, 56, 50, 60, 62 ]
            )