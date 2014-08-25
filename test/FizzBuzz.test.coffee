expect = require 'expect.js'
scrambledImage = require '../bin/ScrambledImage.js'

describe "FizzBuzz", ->

    f = new scrambledImage.FizzBuzz

    it "returns Fizz when 3 is given", ->
        result = f.returnString( 3 )
        expect( result ).to.be( "Fizz" )