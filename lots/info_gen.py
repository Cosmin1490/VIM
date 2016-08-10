#!/usr/bin/python
import os
import sys
import string

data = """#include <vector>
#include <list>
#include <map>
#include <set>
#include <deque>
#include <queue>
#include <stack>
#include <bitset>
#include <algorithm>
#include <functional>
#include <numeric>
#include <utility>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <cctype>
#include <string>
#include <cstring>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <fstream>
#include <iterator>
#include <assert.h>
#include <random>
#include <unordered_map>
#include <unordered_set>
using namespace std;

const string file = "$filename";

const string infile = file + ".in";
const string outfile = file + ".out";

const int INF = 0x3f3f3f3f;

//#define ONLINE_JUDGE

int main()
{
#ifdef ONLINE_JUDGE
    ostream &fout = cout;
    istream &fin = cin;
#else
    fstream fin(infile.c_str(), ios::in);
    fstream fout(outfile.c_str(), ios::out);
#endif

    /*code*/

#ifdef ONLINE_JUDGE
#else
    fout.close();
    fin.close();
#endif
}
"""

makeData = """all: $filename.cpp 
	g++ -g $filename.cpp -Wall -Wextra -std=c++11 -o $filename.exe
run: $filename.cpp
	g++ $filename.cpp -Wall -Wextra -std=c++11 -o $filename.exe
	./$filename.exe
clean: 
	rm *.exe
"""
fileName = sys.argv[1];

s = string.Template(data);
data = s.substitute(filename=fileName);
s = string.Template(makeData);
makeData = s.substitute(filename=fileName);

if not os.path.exists(fileName):
    os.makedirs(fileName);


os.chdir(fileName);

with open(fileName + ".cpp", "w") as myFile:
    myFile.write(data);

with open(fileName + ".in", "w") as myFile:
    myFile.write("\n");

with open(fileName + ".out", "w") as myFile:
    myFile.write("\n");

with open("Makefile", "w") as myFile:
    myFile.write(makeData);

