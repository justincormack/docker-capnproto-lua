FROM justincormack/luajit2.1
RUN \
  git clone https://github.com/justincormack/capnproto.git && \
  cd capnproto && \
  git checkout musl && \
  cd c++ && \
  autoreconf -i && \
  ./configure && \
  make -j6 check && \
  make install && \
  luarocks install lua-capnproto && \
  curl http://www.kyne.com.au/~mark/software/download/lua-cjson-2.1.0.tar.gz | gunzip | tar xf - && \
  cd lua-cjson-2.1.0 && luarocks make
