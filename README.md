# bar-of-progress

Everyone knows that progress bars are one of the hard, unsolved problems of computer science, so I decided to give it a shot.

![xkcd rocks](http://imgs.xkcd.com/comics/estimation.png)

## API

Boring, normal progress bars:

``` ruby
bar = BarOfProgress.new #=> defaults to completeness == "100"  

bar.progress #=> "[◌◌◌◌◌◌◌◌◌◌]"

bar.progress(50) #=> "[●●●●●◌◌◌◌◌]"

bar.progress(49) #=> "[●●●●○◌◌◌◌◌]"
```
