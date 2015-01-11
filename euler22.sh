#!/bin/bash

cat p022_names.txt | sed 's/"//g' | tr "," "\n" | sort | python problem22.py
