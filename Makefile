all: vm disassembler

vm: vm.c
	g++ -ggdb3 vm.c -o vm

disassembler: disassembler.c
	g++ -ggdb3 disassembler.c -o disassembler
