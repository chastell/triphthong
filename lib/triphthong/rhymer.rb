require_relative 'verse_store'

module Triphthong class Rhymer
  def rhyme lengths: '', rhymes: '', verse_store: VerseStore.new
    lengths.split('-').map(&:to_i).map do |length|
      verse_store.rhymed(length: length)
    end.join "\n"
  end
end end
