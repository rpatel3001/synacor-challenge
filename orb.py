from collections import deque

grid = [["*",  "8", "-",  "1"],
		["4",  "*", "11", "*"],
		["+",  "4", "-",  "18"],
		["22", "-", "9",  "*"]]
root = (3,0)
dest = (0, 3)
dval = 30

paths = deque()
Q = deque()

Q.append((root, ""))

while len(Q) != 0:
	pos, path = Q.popleft()
	curr = grid[pos[0]][pos[1]]
	if pos == root and path != "":
		continue
	if len(path) != 0 and path[-1].isdigit():
		path = "(" + path + ")" + curr
	else:
		path += curr
	try:
		if pos == dest:
			if eval(path) == dval:
				print(path)
				raise SystemExit
			else:
				continue
	except SystemExit:
		pass#raise
	except:
		pass
	if pos[0] != 0:
		Q.append(((pos[0] - 1, pos[1]), path))
	if pos[1] != 0:
		Q.append(((pos[0], pos[1] - 1), path))
	if pos[0] != 3:
		Q.append(((pos[0] + 1, pos[1]), path))
	if pos[1] != 3:
		Q.append(((pos[0], pos[1] + 1), path))
