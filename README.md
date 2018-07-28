# basic-of-programming
[basic of programming](https://www.amazon.co.jp/%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E3%81%AE%E5%9F%BA%E7%A4%8E-Computer-Science-Library-%E6%B5%85%E4%BA%95/dp/4781911609)をやってみる

## install
```
$ brew install ocaml
$ brew install rlwrap
```

## settings
```
$ cat ~/.ocamlinit
let printer ppf = Format.fprintf ppf "\"%s\"";;
#install_printer printer;;
```
