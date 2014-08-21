# bar-of-progress

Everyone knows that progress bars are one of the hard, unsolved problems of computer science, so I decided to give it a shot.

![xkcd rocks](http://imgs.xkcd.com/comics/estimation.png)

## API

### Default progress bars

``` ruby
bar = BarOfProgress.new #=> defaults to completeness == "100"  

bar.progress #=> "[◌◌◌◌◌◌◌◌◌◌]"

bar.progress(50) #=> "[●●●●●◌◌◌◌◌]"

bar.progress(49) #=> "[●●●●◍◌◌◌◌◌]"
```

### Custom progress bars

``` ruby
bar = BarOfProgress.new(
  :total => 115.5,             #=> default (will be converted to BigDecimal): 100
  :length => 14,               #=> default (will be converted to Fixnum): 10
  :braces => %w{( )},          #=> default: ["[", "]"]
  :complete_indicator => "■",  #=> default: "●"
  :partial_indicator => "▤",   #=> default: "◍"
  :incomplete_indicator => "□" #=> default: "◌"
)

bar.progress(30) #=> "(■■■▤□□□□□□□□□□)"

```
