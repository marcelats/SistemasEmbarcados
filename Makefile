file = sobel
all:
	iverilog -Wall -o $(file).vvp $(file)_tb.v $(file).v
	vvp $(file).vvp -lxt2
clean:
	rm $(file).vvp $(file)_tb.lxt
