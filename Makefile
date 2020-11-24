file = sobel
all: preprocessing compile run postprocessing
preprocessing:
	octave-cli --eval "imtobin('bicho.png', 'bicho.bin');"
compile:
	iverilog -Wall -o $(file).vvp $(file)_tb.v $(file).v
run: compile preprocessing
	vvp $(file).vvp
postprocessing: run
	octave-cli --eval "bintoim('sobel.bin', 'sobel.png');"
clean:
	rm $(file).vvp bicho.bin sobel.bin sobel.png
