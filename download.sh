#!/bin/sh

mkdir data
wget https://zissou.infosci.cornell.edu/convokit/datasets/movie-corpus/movie-corpus.zip
unzip movie-corpus.zip -d data
rm movie-corpus.zip
