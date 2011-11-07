module Triphthong module Text
  def sentences
    SRX::Polish::SentenceSplitter.new self
  end
end end
