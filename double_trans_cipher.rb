# Double transposition cipher
module DoubleTranspositionCipher
  def self.gen_mapping(doc_len, factor, key, reversed = false)
    num_gen = Random.new(key.to_i)
    mapping = (0..doc_len / factor - 1).to_a.shuffle(random: num_gen).product((0..factor - 1).to_a.shuffle(random: num_gen)).map { |pair| pair.first * factor + pair.last }
    mapping = Hash[mapping.zip((0..doc_len - 1).to_a)] if reversed
    mapping
  end

  def self.encrypt(document, key)
    int_key = key.to_i
    doc_len = document.to_s.length
    ((doc_len**0.5).to_i..doc_len).each do |num|
      if doc_len % num == 0
        rng = Random.new(key.to_i)
        row_order = (0..doc_len/num-1).to_a.shuffle(random: rng)
        col_order = (0..num-1).to_a.shuffle(random: rng)
        mapping = row_order.product(col_order).map { |pair| pair.first * num + pair.last}
        doc_chars = document.to_s.chars
        return doc_chars.each_with_index.map do |char, index|
          doc_chars[mapping[index]]
        end.join
      end
    end
  end

  def self.decrypt(ciphertext, key)
    int_key = key.to_i
    doc_len = ciphertext.to_s.length
    ((doc_len**0.5).to_i..doc_len).each do |num|
      if doc_len % num == 0
        rng = Random.new(key.to_i)
        row_order = (0..doc_len/num-1).to_a.shuffle(random: rng)
        col_order = (0..num-1).to_a.shuffle(random: rng)
        mapping = Hash[row_order.product(col_order).map { |pair| pair.first * num + pair.last}.zip((0..doc_len-1).to_a)]
        doc_chars = ciphertext.to_s.chars
        return doc_chars.each_with_index.map do |char, index|
          doc_chars[mapping[index]]
        end.join
      end
    end
  end
end
