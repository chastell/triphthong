Triphthong
==========

Triphthong is a (currently, Polish-only) syllable counter and an (extremely poor) syllable splitter.

Usage
-----

``` Ruby
require 'triphthong'

text = Verse.new 'Litwo! Ojczyzno moja!'

text.syllable_count         #=> 7
text.has_caesura_after? 7   #=> true
text.rhyme_pattern          #=> 'oja'
```

To do
-----

* improve #rhyme_pattern to pass Pan Tadeusz test
* add Balladyna, Beniowski, Monacho- and Antymonachomachia to fixtures
* refactor `Executable#run`
* handle laur/laurka/laurowy syllable counts
* update README with executable usage examples
* add syllable splitter
* support for other languages

---

© MMXI-MMXII Piotr Szotkowski <chastell@chastell.net>, licensed under AGPL 3 (see LICENCE)
