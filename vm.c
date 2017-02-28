#include <sys/stat.h>
#include <fstream>
#include <iostream>
#include <stack>

uint16_t prog[32768];

void execute() {
	uint16_t IP = 0;
	uint16_t REG[8];
	std::stack<uint16_t> STACK;
}

int main(int argc, char** argv) {
	struct stat prog_stat;
	std::ifstream prog_file;

	if(argc != 2) {
		std::cout << "Usage: ./vm binary_file" << std::endl;
		return -1;
	}
	if(stat(argv[1], &prog_stat)){
		std::cout << "Error stat-ing file" << std::endl;
		return -1;
	}
	if(prog_stat.st_size > 65536) {
		std::cout << "Program size too big" << std::endl;
		return -1;
	} else {
		std::cout << "Program is " << prog_stat.st_size << " bytes" << std::endl;
	}
	prog_file.open(argv[1], std::ios::in | std::ios::binary);
	// take advantage of x86 being little endian and read raw bytes into an array of uint16_t
	prog_file.read((char*)prog, prog_stat.st_size);

	execute();
}
