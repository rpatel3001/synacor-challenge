#include <sys/stat.h>
#include <fstream>
#include <iostream>
#include <string>
#include <cstring>
#include <list>
#include <sstream>

uint16_t prog[32768];
std::list<std::string> assem;

int params[] = {0, 2, 1, 1, 3, 3, 1, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 1, 0, 1, 1, 0};
std::string ops[] = {"halt", "set ", "push", "pop ", "eq  ", "gt  ", "jmp ", "jt  ", "jf  ", "add ", "mult", "mod ", "and ", "or  ", "not ", "rmem", "wmem", "call", "ret ", "out ", "in  ", "noop"};
void disassemble() {
	for (size_t i = 0; i < 32768; ++i) {
		std::stringstream sout;
		uint16_t op = prog[i];

		if (op > 21) {
			continue;
		} else if (op == 19) {
			sout << "out \"";
			while (op == 19) {
				if((char)prog[i+1] == '\n') {
					sout << "\\n";
					i += 2;
					break;
				}
				sout << (char)prog[i+1];
				i += 2;
				op = prog[i];
			}
			--i;
			sout << "\"";
		} else {
			sout << params[op] << " " << i << " " << ops[op] << "\t";
			for (size_t j = 1; j <= params[op]; ++j) {
				uint16_t val = prog[i+j];
				if (val < 32768) {
					sout << val << "\t";
				} else {
					sout << "reg" << (val-32768) << "\t";
				}
			}
			i += params[op];
		}
		assem.push_back(sout.str());
	}
}

int main(int argc, char** argv) {
	struct stat prog_stat;
	std::ifstream prog_file;

	if (argc < 2) {
		std::cout << "Usage: ./disassmbler binary_file" << std::endl;
		return -1;
	}
	if (stat(argv[1], &prog_stat)) {
		std::cout << "Error stat-ing file" << std::endl;
		return -1;
	}
	if (prog_stat.st_size > 65536) {
		std::cout << "Program size too big" << std::endl;
		return -1;
	}

	prog_file.open(argv[1], std::ios::in | std::ios::binary);
	// take advantage of x86 being little endian and read raw bytes into an array of uint16_t
	prog_file.read((char*)prog, prog_stat.st_size);
	prog_file.close();

	disassemble();

	std::ofstream outfile(strcat(argv[1], ".asm"), std::ios::out);
	for (std::string s : assem) {
		outfile << s << std::endl;
	}
	outfile.close();
}