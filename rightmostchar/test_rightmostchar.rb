require 'minitest/autorun'
require_relative 'rightmostchar'

class RightMostCharTest < Minitest::Test
  def test_index_1
    assert_equal 8, RightMostChar.new("Hello World,r").index
  end
  
  def test_index_2
    assert_equal 10, RightMostChar.new("Hello CodeEval,E").index
  end
  
  def test_index_3
    assert_equal -1, RightMostChar.new("Are you there,z").index
  end
end

=begin
kWMrhwPoWp4FAQZ4eEp4IyxCokbpkgQN4Xo4dmS2hvjvtccMArTe,E
DmNdv4ZYiThkgzcynDp4buhoiuX,1
BxsWAmy30JMbPKJOU wjT83M,X
Eu RTTmAWZG3Ip9pyw59hSLNtdw00MlS5aLmCtnlg9G06z0CAuj0sVHZ1fOBi4VIGMZ8nyrJIPrATypN,o
Hello CodeEval,E
Hello World,r
M1CN9MGDWcDEV0XdpqXaP2BYzVRTh,M
A86H3DhoeMIGLMC0skhBojtB f4CXte4HDSs2b6gj,0
GGLR5jtqRKq2gghXrVmKVyj943FW363TH7kezKGZbi5sTy2HdkJyci2OYe1HXjPm  u EePP,U
6GW47kl0MnBMzw12PSXJ6mFdL9VkbjbfEAPD9WkpgFChsGwHsnCduDB SA4zmh1a5mC8chS0PLK,g
How to learn to Cook,C
What is your name,m
 EBDnIG0V1hmDpxDHInODOtKwaeRcj9PyvnjwzIs5fIbRhft8rB33hgcJcRsr7NU,l
8jsZPkzSY3OtdghhRVvt Q,P
d3ebfnwpOO0FGQdJvMml09T O 2g65fmFR4eTLDliEehOX4UTuvCWrDpW9FBk5icwwLWTM OlPL,F
l5o1uaJosopcSygBME4Tbpouf8JiEXaBGyqU,M
fe5n4WHbh693GrC9ngnFEaChA22WY5MMoBAaqjxO2S4lMfLu6z8ACk91TMBUjx,M
Nd0FrTrIhFq4TDmvRwAOSI0zhkc5HrgiCTE7vtU6rnh4Wl,t
KH0lecBcMGnOOpYsxBJuK2E5Msj4JR,3

=end
