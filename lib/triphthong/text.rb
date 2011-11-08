module Triphthong module Text
  def sentences
    Enumerator.new do |yielder|
      SRX::Polish::SentenceSplitter.new(self).each do |sentence|
        yielder.yield sentence.gsub(/\s+/, ' ').strip.extend Verse
      end
    end
  end
end end
