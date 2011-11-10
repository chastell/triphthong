Triphthong w Turnieju Elektrybałtów
===================================

Użycie Triphthonga w [Turnieju Elektrybałtów](http://turniej.wolnelektury.pl) było testowane z Ruby 1.9.3 (choć prawdopodobnie wystarczy Ruby 1.9.2).

Instalacja i użycie z gema:

* `gem install triphthong`
* `triphthong build-db-from-api` (lub ściągnięcie pliku [`db.yml`](https://raw.github.com/chastell/triphthong/master/db.yml))
* `triphthong rhyme`
* `triphthong rhyme`
* `triphthong rhyme`

Instalacja i użycie ze źródeł:

* `git clone git://github.com/chastell/triphthong.git`
* `cd triphthong`
* `gem install bundler`
* `bundle`
* `bin/triphthong build-db-from-api` (można pominąć, plik `db.yml` jest w repozytorium)
* `bin/triphthong rhyme`
* `bin/triphthong rhyme`
* `bin/triphthong rhyme`
