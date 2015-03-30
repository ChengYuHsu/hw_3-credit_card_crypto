require 'benchmark'
require_relative '../substitution_cipher.rb'

n = 5_000
doc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed sapien quam. Sed dapibus est id enim facilisis, at posuere turpis adipiscing. Quisque sit amet dui dui. Duis rhoncus velit nec est condimentum feugiat. Donec aliquam augue nec gravida lobortis. Nunc arcu mi, pretium quis dolor id, iaculis euismod ligula. Donec tincidunt gravida lacus eget lacinia. Cras et dui mollis, tempus velit placerat, sodales tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque et venenatis sapien. Maecenas sem diam, lacinia in ipsum et, fermentum rutrum lacus. Nulla facilisis, arcu ac facilisis tincidunt, tortor est"
key = Random.rand(20)

Benchmark.bmbm do |round|
	round.report('Caeser Cipher') do
		n.times do
			enc = SubstitutionCipher::Caeser.encrypt(doc, key)
			dec = SubstitutionCipher::Caeser.decrypt(enc, key)
		end
	end

	round.report('Permutation Cipher') do
		n.times do
			enc = SubstitutionCipher::Permutation.encrypt(doc, key)
			dec = SubstitutionCipher::Permutation.decrypt(enc, key)
		end
	end
end