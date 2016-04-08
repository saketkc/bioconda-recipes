#!/bin/bash
#

CC=${PREFIX}/bin/gcc
CPP=${PREFIX}/bin/g++
MEME_ETC_DIR=${PREFIX}/etc
# XML::Parser::Expat
#cpan /home/saket/anaconda2/conda-bld/work/meme_4.11.1/tests/scripts
cpanm YAML
cpanm HTML::PullParser
cpanm XML::Simple
cpanm CGI
cpanm HTML::Template
cpanm HTML::Parse
cpanm CGI::Application
#cpanm HTML::Template
#cpanm XML::Compile::SOAP11
#cpanm XML::Compile::WSD11
#cpanm XML::Compile::Transport::SOAPHTTP
cpanm XML::Parser::Expat --configure-args "EXPATLIBPATH=$PREFIX/lib" --configure-args "EXPATHINCPATH=$PREFIX/include"
#perl scripts/dependencies.pl | sed -n -e 's/missing.*//p' | cpanm
./configure --prefix="$PREFIX" --with-gnu-ld # --enable-build-libxml2 --enable-build-libxslt
make clean
make AM_CFLAGS='-DNAN="(0.0/0.0)"'
MEME_ETC_DIR=${PREFIX}/etc
make test
make install

