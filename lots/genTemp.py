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
#include <random>
#include <assert.h>
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

fileName = sys.argv[1];

s = string.Template(data);
data = s.substitute(filename=fileName);

with open("main.cpp", "w") as myFile:
    myFile.write(data);

with open(fileName + ".in", "w") as myFile:
    myFile.write("\n");

with open(fileName + ".out", "w") as myFile:
    myFile.write("\n");
