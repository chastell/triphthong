Triphthong
==========

Triphthong is a (currently, Polish-only) syllable counter and an (extremely poor) syllable splitter.

Usage
-----

``` Ruby
require 'triphthong'

text = Triphthong.new 'Litwo! Ojczyzno moja!'

text.syllable_count   #=> 7
text.syllables        #=> ['li', 'two', 'o', 'jczy', 'zno', 'mo', 'ja']
```

To do
-----

* better edge case handling
* make syllable splitter split into actual syllables
* add support for other languages
* add Beniowski to fixtures

---

© MMXI Piotr Szotkowski <chastell@chastell.net>, licensed under AGPL 3 (see LICENCE)
