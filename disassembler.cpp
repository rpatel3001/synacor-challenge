#include <sys/stat.h>
#include <fstream>
#include <iostream>
#include <string>
#include <cstring>
#include <map>
#include <sstream>
#include <iomanip>

uint16_t prog[32768];
std::map<uint16_t, std::string> assem;
std::map<uint16_t, std::string> funcs;
std::map<uint16_t, std::string> labels;

std::string regval(uint16_t val) {
	if (val >= 32768) {
		return "reg" + std::to_string(val-32768);
	} else {
		return std::to_string(val);
	}
}

void func3() {
	
}

int params[] = {0, 2, 1, 1, 3, 3, 1, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 1, 0, 1, 1, 0};
std::string ops[] = {"halt", "set ", "push", "pop ", "eq  ", "gt  ", "jmp ", "jt  ", "jf  ", "add ", "mult", "mod ", "and ", "or  ", "not ", "rmem", "wmem", "call", "ret ", "out ", "in  ", "noop"};
void disassemble(size_t size) {
	size_t func_count = 0;
	size_t label_count = 0;
	for (size_t i = 0; i < size; ++i) {
		std::stringstream sout;
		uint16_t op = prog[i];
		uint16_t instr = i;
		if (op > 21) {
			continue;
		} else if (op == 19) {
			if (prog[i+1] >= 32768) {
				sout << "out\treg" << (prog[++i]-32768);
			} else {
				sout << "out\t\"";
				while (op == 19) {
					if ((char)prog[i+1] == '\n') {
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
			}
		} else if (op == 6) {
			uint16_t addr = prog[++i];
			sout << "jmp\t";
			if (addr >= 32768) {
				sout << "reg" << (addr-32768);
			} else {
				if (labels.find(addr) == labels.end()) {
					labels[addr] = "label" + std::to_string((label_count++));
				}
				sout << labels[addr];
			}
		} else if (op == 7) {
			uint16_t test = prog[++i];
			uint16_t addr = prog[++i];
			sout << "jt\t";
			if (test < 32768) {
				sout << test << "\t";
			} else {
				sout << "reg" << (test-32768) << "\t";
			}
			if (addr >= 32768) {
				sout << "reg" << (addr-32768);
			} else {
				if (labels.find(addr) == labels.end()) {
					labels[addr] = "label" + std::to_string((label_count++));
				}
				sout << labels[addr];
			}
		} else if (op == 8) {
			uint16_t test = prog[++i];
			uint16_t addr = prog[++i];
			sout << "jf\t";
			if (test < 32768) {
				sout << test << "\t";
			} else {
				sout << "reg" << (test-32768) << "\t";
			}
			if (addr >= 32768) {
				sout << "reg" << (addr-32768);
			} else {
				if (labels.find(addr) == labels.end()) {
					labels[addr] = "label" + std::to_string((label_count++));
				}
				sout << labels[addr];
			}
		} else if (op == 17) {
			uint16_t addr = prog[++i];
			sout << "call\t";
			if (addr >= 32768) {
				sout << "reg" << (addr-32768);
			} else {
				if (funcs.find(addr) == funcs.end()) {
					funcs[addr] = "func" + std::to_string((func_count++));
				}
				sout << funcs[addr];
			}
		} else if (op == 1) {
			sout << "reg" << (prog[++i]-32768) << " = ";
			uint16_t val2 = prog[++i];
			sout << regval(val2);
		} else if (op == 14) {
			sout << "reg" << (prog[++i]-32768) << " = ~";
			uint16_t val2 = prog[++i];
			sout << regval(val2);
		} else if (op >= 9 && op <= 13) {
			sout << regval(prog[++i]) << " = ";
			sout << regval(prog[++i]);
			if(op == 9) {
				sout << " + ";
			} else if (op == 10) {
				sout << " * ";
			} else if (op == 11) {
				sout << " % ";
			} else if (op == 12) {
				sout << " & ";
			} else if (op == 13) {
				sout << " | ";
			}
			sout << regval(prog[++i]);
		} else if (op == 15) {
			sout << regval(prog[++i]) << " = mem[";
			sout << regval(prog[++i]) << "]";
		} else if (op == 16) {
			sout << "mem[" << regval(prog[++i]) << "] = ";
			sout << regval(prog[++i]);
		} else if (op == 4) {
			sout << regval(prog[++i]) << " = ";
			sout << regval(prog[++i]) << " == ";
			sout << regval(prog[++i]);
		} else if (op == 5) {
			sout << regval(prog[++i]) << " = ";
			sout << regval(prog[++i]) << " > ";
			sout << regval(prog[++i]);
		} else {
			sout << ops[op] << "\t";
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
		assem.insert(make_pair(instr, sout.str()));
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

	for (size_t i = 6068; i < 30050; ++i) {
		prog[i] = prog[i] ^ 16724 ^ ((i * i) % 32768);
	}

	prog[6069] = 84;

	int j = prog[6116] + 6117;
	for (size_t i = 0; i < j; ++i) {
		prog[6091 + i] = prog[6117 + i];
	}

	prog[6080] = prog[6080] + prog[6099] + 1;
	prog[6099] = 44;

	disassemble(prog_stat.st_size/2);

	std::ofstream outfile(strcat(argv[1], ".asm"), std::ios::out);
	for (auto line : assem) {
		if (labels.find(line.first) != labels.end()) {
			outfile << labels[line.first] << ":" << std::endl;
		}
		if (funcs.find(line.first) != funcs.end()) {
			outfile << funcs[line.first] << ":" << std::endl;
		}
		outfile << "\t" << line.first << "\t" << line.second << std::endl;
	}
	outfile.close();
}
