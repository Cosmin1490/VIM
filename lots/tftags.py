#!/usr/bin/env python
# -*- coding: utf-8 -*-

import codecs
import os
import pprint
import re
import shlex
import sys

resourcePattern = re.compile("^[ \t]*resource[ \t]+\"([a-zA-Z0-9_\-]+)\"[ \t]+\"([a-z0-9A-Z_\-]+).*\".*$", re.DOTALL);
variablePattern = re.compile("^[ \t]*variable[ \t]+\"([a-zA-Z0-9_\-]+)\".*$", re.DOTALL);
outputPattern = re.compile("^[ \t]*output[ \t]+\"([a-zA-Z0-9_\-]+)\".*$", re.DOTALL);

correctAnswerPattern = re.compile("^([0-9]+)\.\s+([A-E]+)$", re.DOTALL);

parsed = {};
variables = [];
outputs = [];

output = [];
inputFilePath = sys.argv[len(sys.argv) - 1]
inputFileName = os.path.basename(inputFilePath)
with codecs.open(inputFilePath, "r", "utf8") as inputFile:
    for index, line in enumerate(inputFile):
        matcher = resourcePattern.match(line)
        variableMatcher = variablePattern.match(line)
        outputsMatcher = outputPattern.match(line)
        if matcher:
            if not str(matcher.group(1)) in parsed:
                parsed[str(matcher.group(1))] = [];
            parsed[str(matcher.group(1))].append({
                "name": str(matcher.group(2)),
                "regex": str(matcher.group(2)),
                "index": index,
                "fileName": inputFileName
            })
        elif variableMatcher:
            variables.append({
                "name": str(variableMatcher.group(1)),
                "regex": str(variableMatcher.group(1)),
                "index": index,
                "fileName": inputFileName
            })
        elif outputsMatcher:
            outputs.append({
                "name": str(outputsMatcher.group(1)),
                "regex": str(outputsMatcher.group(1)),
                "index": index,
                "fileName": inputFileName
            })

for key in parsed:
    for item in parsed[key]:
        oline = item["name"] + "\t" + item["fileName"] + "\t/" + item["regex"] + " $/;\"" + "\tm\tline:" + str(item["index"] + 1) + "\tresource:" + key + "\tfile:\taccess:public";
        output.append(oline);

for item in variables:
    oline = item["name"] + "\t" + item["fileName"] + "\t/" + item["regex"] + " $/;\"" + "\tv\tline:" + str(item["index"] + 1);
    output.append(oline);

for item in outputs:
    oline = item["name"] + "\t" + item["fileName"] + "\t/" + item["regex"] + " $/;\"" + "\to\tline:" + str(item["index"] + 1);
    output.append(oline);

print("\n".join(output))

