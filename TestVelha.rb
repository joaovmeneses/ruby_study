require 'test/unit'
require './Velha.rb'

class TestVelha < Test::Unit::TestCase
    
    def testVerifyIfWin()
        velha = Velha.new
        resp = velha.verifyIfWin("X")
        expected = true
        assert_equal(expected, resp)
    end

end