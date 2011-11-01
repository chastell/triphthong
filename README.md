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
* use unicode or unicode_utils gem for {down,up}casing

---

© MMXI Piotr Szotkowski <chastell@chastell.net>, licensed under AGPL 3 (see LICENCE)
