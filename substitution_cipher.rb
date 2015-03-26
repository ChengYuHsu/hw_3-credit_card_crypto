module SubstitutionCipher
  module Caeser
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      document.to_s.chars.map{ |char|
        ((char.ord + key) % 128).chr
      }.join 
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      document.to_s.chars.map{ |char|
        ((char.ord - key) % 128).chr
      }.join
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      mapping = Hash[(0..127).to_a.zip((0..127).to_a.shuffle(random: Random.new(key)))]
      document.to_s.chars.map{ |char|
        mapping[char.ord].chr
      }.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      mapping = Hash[(0..127).to_a.shuffle(random: Random.new(key)).zip((0..127).to_a)]
      document.to_s.chars.map{ |char|
        mapping[char.ord].chr
      }.join
    end
  end
end
