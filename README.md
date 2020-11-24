# Operador Sobel

Requisitos:

[octave](https://packages.debian.org/stable/octave)

[iverilog](https://packages.debian.org/stable/iverilog)

Para rodar:

- No Octave converta a imagem original -> binário cru `imtobin('bicho.png', 'bicho.bin');`

- Compile e rode a simulação em verilog

```
$ iverilog -Wall -o sobel.vvp sobel_tb.v sobel.v
$ vvp sobel.vvp
```

- No Octave converta o resultado binário cru -> imagem `bintoim('sobel.bin', 'sobel.png');`

Ou simplesmente execute `make` na raiz do projeto.


