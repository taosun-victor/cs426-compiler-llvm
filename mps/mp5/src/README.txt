1. Download and install the sources for LLVM 3.9 from here:
	http://llvm.org/releases/3.9.0/llvm-3.9.0.src.tar.xz
	http://llvm.org/releases/3.9.0/cfe-3.9.0.src.tar.xz
   Unpack the LLVM source code anywhere in your account space.
   Unpack the Clang source code in llvm-3.9.0.src/tools/ and
   rename cfe-3.9.0.src/ to clang/.

2. Follow the instructions in the LLVM Getting Started Guide
   to run CMake and then to compile the LLVM tree.
   The file cmake_cmd.csh shows an example CMake command line
   I use to configure the LLVM build; modify LLVMROOT as
   you need.  (The rest should work for you, but feel free to
   change anything you want if you know what you are doing.)
   Assume $LLVMSRCROOT and $LLVMOBJROOT are the source and
   object code directories (keep these separate).

3. Unpack the MP5 tar file, and copy the contents of src directory
   (ADCE.cpp, LICM.cpp, CMakeLists) into a new directory somewhere
   in the LLVM source tree, e.g., lib/Transforms/Scalar/MP4/.

4. Add the following line in CMakeLists.txt in the parent directory of MP5:
	add_subdirectory(MP5)

5. Go to $LLVMOBJROOT and run 'make'.
   This should complete successfully and produce a loadable
   module $LLVMOBJROOT/lib/LLVMMP5.so.  You can run our ADCE 
   with:
	opt -load $LLVMOBJROOT/lib/LLVMMP4.so <other_passes> \
	    -mp4-adce <more_passes> input.bc -o output.bc
   and similarly mp5-licm.  (Rename those passes to replace "mp5"
   with your netid, as explained in the handout.)

6. Read the instructions in the LLVM doc, "Writing an LLVM Pass"
   for detailed instructions on how to write, build and run an 
   LLVM pass.  The above steps are enough to get you started
   but the document will explain in more detail the rest of
   what you need to know about general pass structure, etc.

