#/bin/csh -f
#------------------------------------------------------------------------------
# cmake command line to configure LLVM builds
#------------------------------------------------------------------------------

#Only these variables need to be edited for each LLVM tree
set LLVMROOT = /class/cs426/cs426/compile/kotsifa2/llvm
set LLVMSRCROOT = ${LLVMROOT}/llvm-3.9.0.src
set LLVMOBJROOT = ${LLVMROOT}/llvm-3.9.0.obj

cmake -G "Unix Makefiles" \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_INSTALL_PREFIX=${LLVMOBJROOT} \
	-DCMAKE_BUILD_TYPE=Release \
	-DLLVM_ENABLE_ASSERTIONS=On \
	-DBUILD_SHARED_LIBS=On \
	-DLLVM_TARGETS_TO_BUILD=X86 \
	${LLVMSRCROOT}

