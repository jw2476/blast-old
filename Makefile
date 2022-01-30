CPPFLAGS := -Iinclude
LDFLAGS := -Llib -lraylib -lglfw3 -lrt -lm -ldl -lpthread

blast: build/raylib build/llvm
	g++ $(wildcard src/*.cpp) $(CPPFLAGS) $(LDFLAGS) -o blast
	./blast

build/raylib:
	cd build && mkdir -p raylib && cd raylib && cmake ../../deps/raylib && make -j 4

build/llvm:
	cd build && mkdir -p llvm && cd llvm && mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=.. -DLLVM_ENABLE_PROJECTS=llvm -DLLVM_TARGETS_TO_BUILD=X86 ../../../deps/llvm/llvm && make -j 4