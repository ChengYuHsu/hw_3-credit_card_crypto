require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require 'minitest/autorun'

# put your crypto module here
cryptos = [
  SubstitutionCipher::Caesar,
  SubstitutionCipher::Permutation,
  DoubleTranspositionCipher
]

describe 'Test card info encryption' do
  # before each testing
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
    @key = 3
  end
  # test all the crypto methods
  cryptos.each do |method|
    describe 'Using #{method}' do
      # test encryption
      it 'should encrypt card information' do
        enc = method.encrypt(@cc, @key)
        enc.wont_equal @cc.to_s
      end
      # test decryption
      it 'should decrypt text' do
        enc = method.encrypt(@cc, @key)
        dec = method.decrypt(enc, @key)
        dec.must_equal @cc.to_s
      end
    end
  end
end
