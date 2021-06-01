CC = clang

# Change this to your llvm object code tree
MP4LLVMOBJROOT = /class/cs426/cs426/compile/kotsifa2/llvm/llvm-3.9.0.obj
OPT = opt -load ${MP4LLVMOBJROOT}/lib/LLVMMP4.so

# Change this to run whatever optimization passes you want
OPTS = -simplifycfg -instcombine -inline -globaldce -instcombine -simplifycfg -mp4-adce -sroa -mem2reg -mp4-adce -verify -sccp -adce -mp4-licm -instcombine -dce -simplifycfg -deadargelim -globaldce

# Make a .ll file from a .bc file, using llvm-dis
%.ll: %.bc
	llvm-dis < $< > $@

# Make a .bc file from a .c file by running through llvm-gcc, with
# optimizations turned off, and then running a few basic
# optimizations.
%.bc: %.c
	$(CC) -c -O0 -emit-llvm $< -o - | opt -globaldce -mem2reg -instcombine -constprop  > $@

# Run the optimizations specified in OPTS
%-opt.bc: %.bc
	$(OPT) $(OPTS) < $< > $@

clean :
	rm -f *.bc *.ll
