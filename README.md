Triphthong
==========

Triphthong is a (currently, Polish-only) syllable counter and an (extremely poor) syllable splitter.

Usage
-----

``` Ruby
require 'triphthong'

text = 'Litwo! Ojczyzno moja!'.extend Triphthong::Verse

text.syllable_count         #=> 7
text.has_caesura_after? 7   #=> true
text.rhyme_pattern          #=> 'oja'
```

To do
-----

* better edge case handling
* make syllable splitter split into actual syllables
* add support for other languages
* add Beniowski to fixtures
* improve #rhyme_pattern to pass Pan Tadeusz test

---

© MMXI Piotr Szotkowski <chastell@chastell.net>, licensed under AGPL 3 (see LICENCE)
