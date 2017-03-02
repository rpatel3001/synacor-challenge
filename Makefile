all: vm disassembler

vm: vm.cpp
	g++ -ggdb3 vm.cpp -o vm

disassembler: disassembler.cpp
	g++ -ggdb3 disassembler.cpp -o disassembler
