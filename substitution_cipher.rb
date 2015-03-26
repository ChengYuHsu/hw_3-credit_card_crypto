module SubstitutionCipher
  ORD_RANGE ||= (0..127).to_a
  module Caeser
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      document.to_s.chars.map do |char|
        ((char.ord + key) % 128).chr
      end.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      document.to_s.chars.map do |char|
        ((char.ord - key) % 128).chr
      end.join
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      mappings = Hash[ORD_RANGE.zip(ORD_RANGE.shuffle(random: Random.new(key)))]
      document.to_s.chars.map do |char|
        mappings[char.ord].chr
      end.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      mappings = Hash[ORD_RANGE.shuffle(random: Random.new(key)).zip(ORD_RANGE)]
      document.to_s.chars.map do |char|
        mappings[char.ord].chr
      end.join
    end
  end
end
