require 'sinatra/base'
require 'haml'
require 'sass'

module Triphthong class App < Sinatra::Base
  enable :inline_templates
  set :root, File.join(File.dirname(__FILE__), '..', '..')
  set :public_folder, Proc.new { File.join root, 'public' }

  get '/' do
    @poet = 'index'
    haml :index
  end

  get '/julek' do
    @poet = 'julek'
    @verses = rhyme :julek
    haml :poem
  end

  get '/micky' do
    @poet = 'micky'
    @verses = rhyme :micky
    haml :poem
  end

  private

  def rhyme whom
    case whom
    when :julek
      structure = '5+6'
      strophes  = 8
    when :micky
      structure = '7+6'
      strophes  = 8
    end

    db = YAML::Store.new 'db.yml'
    verses = []
    db.transaction true do
      rhymes = db[structure]
      strophes.times do
        loop do
          a, b = rhymes[rhymes.keys.sample].sample 2
          next unless a.rhymes_with? b
          next if a.source and b.source and a.source == b.source
          verses += [a, b]
          break
        end
      end
    end
    verses
  end
end end

__END__

@@ layout
!!! 5
/ THIS CODE IS AWFUL AND WILL BE REWRITTEN
%html{ id: @poet }
  %head
    %meta{ charset: 'UTF-8' }
    %title jedenaście do trzynastu
    %style
      :sass
        *
          font-size: 16px
          margin: 0 auto
          padding: 0
        a
          color: inherit
          text-decoration: none
        body
          background: url(julek.png) bottom left no-repeat, url(micky.png) bottom right no-repeat
          height: 100%
        h1
          margin-bottom: 1em
          a
            font-size: 30px
        html
          height: 100%
        #index
          background-image:    -moz-linear-gradient(left, #fff 0%, #fff 50%, #000 50%, #000 100%)
          background-image:     -ms-linear-gradient(left, #fff 0%, #fff 50%, #000 50%, #000 100%)
          background-image:      -o-linear-gradient(left, #fff 0%, #fff 50%, #000 50%, #000 100%)
          background-image: -webkit-gradient(linear, left top, right top, color-stop(0%, #fff), color-stop(50%, #fff), color-stop(50%, #000), color-stop(100%, #000))
          background-image: -webkit-linear-gradient(left, #fff 0%, #fff 50%, #000 50%, #000 100%)
          background-image:         linear-gradient(left, #fff 0%, #fff 50%, #000 50%, #000 100%)
          color: #888
          text-align: center
        #julek
          background-image:    -moz-linear-gradient(left, #fff 0%, #fff 70%, #000 70%, #000 100%)
          background-image:     -ms-linear-gradient(left, #fff 0%, #fff 70%, #000 70%, #000 100%)
          background-image:      -o-linear-gradient(left, #fff 0%, #fff 70%, #000 70%, #000 100%)
          background-image: -webkit-gradient(linear, left top, right top, color-stop(0%, #fff), color-stop(70%, #fff), color-stop(70%, #000), color-stop(100%, #000))
          background-image: -webkit-linear-gradient(left, #fff 0%, #fff 70%, #000 70%, #000 100%)
          background-image:         linear-gradient(left, #fff 0%, #fff 70%, #000 70%, #000 100%)
          color: black
          text-align: left
        #micky
          background-image:    -moz-linear-gradient(left, #fff 0%, #fff 30%, #000 30%, #000 100%)
          background-image:     -ms-linear-gradient(left, #fff 0%, #fff 30%, #000 30%, #000 100%)
          background-image:      -o-linear-gradient(left, #fff 0%, #fff 30%, #000 30%, #000 100%)
          background-image: -webkit-gradient(linear, left top, right top, color-stop(0%, #fff), color-stop(30%, #fff), color-stop(30%, #000), color-stop(100%, #000))
          background-image: -webkit-linear-gradient(left, #fff 0%, #fff 30%, #000 30%, #000 100%)
          background-image:         linear-gradient(left, #fff 0%, #fff 30%, #000 30%, #000 100%)
          color: white
          text-align: right
        #jedenascie
          color: black
          float: left
        #trzynascie
          color: white
          float: right
        #poem
          clear: both
          padding-top: 1em
          p
            cursor: help
            margin: 0.5em
        #black
          color: black
          float: left
          padding-top: 2em
          text-align: right
          width: 45%
          a
            border-bottom: 1px solid #ccc
        #white
          color: white
          float: right
          padding-top: 2em
          text-align: left
          width: 45%
          a
            border-bottom: 1px solid #333
  %body
    %h1
      #jedenascie
        %a{ href: '/julek' } jedenaście ←
      #trzynascie
        %a{ href: '/micky' } → trzynaście
    = yield

@@ index
#div{ style: 'clear: both' }
#black
  %p zremiksowane
  %p
    teksty z
    %a{ href: 'http://www.wolnelektury.pl' } Wolnych Lektur
  %p &nbsp;
  %p
    %a{ href: 'http://pl.wikipedia.org/wiki/Juliusz_S%C5%82owacki' } Julek
    i
    %a{ href: 'http://pl.wikipedia.org/wiki/Adam_Mickiewicz' } Micky
    z Wikipedii
  %p
    źródła cytatów w dymkach
#white
  %p ↖ wybierz formę ↗
  %p i odświeżaj aż padniesz
  %p &nbsp;
  %p
    %a{ href: 'http://github.com/chastell/triphthong' } Triphthong
    od
    %a{ href: 'http://chastell.net' } chastella

@@ poem
#poem
  - @verses.each_slice 4 do |slice|
    - slice.each do |verse|
      %p{ title: verse.source }&= verse.text
    %br
  %a{ href: '' } …ну, погоди…
