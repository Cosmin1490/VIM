#!/usr/bin/env python
# -*- coding: utf-8 -*-

import codecs
import os
import pprint
import re
import shlex
import sys

resourcePattern = re.compile("^[ \t]*resource[ \t]+\"([a-zA-Z0-9_\-]+)\"[ \t]+\"([a-z0-9A-Z_\-]+).*\".*$", re.DOTALL);

correctAnswerPattern = re.compile("^([0-9]+)\.\s+([A-E]+)$", re.DOTALL);

parsed = {};
output = [];
inputFilePath = sys.argv[len(sys.argv) - 1]
inputFileName = os.path.basename(inputFilePath)
with codecs.open(inputFilePath, "r", "utf8") as inputFile:
    for index, line in enumerate(inputFile):
        matcher = resourcePattern.match(line)
        if matcher:
            if not str(matcher.group(1)) in parsed:
                parsed[str(matcher.group(1))] = [];
            parsed[str(matcher.group(1))].append({
                "name": str(matcher.group(2)),
                "regex": str(matcher.group(2)),
                "index": index,
                "fileName": inputFileName
            })


for key in parsed:
    for item in parsed[key]:
        oline = item["name"] + "\t" + item["fileName"] + "\t/" + item["regex"] + " $/;\"" + "\tm\tline:" + str(item["index"] + 1) + "\tclass:" + key + "\tfile:\taccess:public";
        output.append(oline);

print("\n".join(output))

