#!/bin/sh

mkdir data
wget https://zissou.infosci.cornell.edu/convokit/datasets/movie-corpus/movie-corpus.zip
unzip movie-corpus.zip
rm movie-corpus.zip
mv movie-corpus data
