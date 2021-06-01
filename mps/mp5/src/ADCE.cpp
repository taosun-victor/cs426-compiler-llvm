#include "llvm/Pass.h"
#include "llvm/IR/Function.h"

#include <iostream>
#include <set>
#include <vector>

using namespace llvm;

namespace {
  //===-------------------------------------------------------------------===//
  // ADCE Class
  //
  // This class does all of the work of Aggressive Dead Code Elimination.
  //
  class ADCE : public FunctionPass {
  private:
    Function *Func;                      // Function we are working on
    std::vector<Instruction*> WorkList;  // Instructions that just became live
    std::set<Instruction*>    LiveSet;   // Set of live instructions
    
    //===-----------------------------------------------------------------===//
    // The public interface for this class
    //
  public:
    static char ID; // Pass identification
    ADCE() : FunctionPass(ID) {}
    
    // Execute the Aggressive Dead Code Elimination algorithm on one function
    //
    virtual bool runOnFunction(Function &F) {
      Func = &F;
      bool Changed = doADCE();
      assert(WorkList.empty());
      LiveSet.clear();
      return Changed;
    }
    
    // getAnalysisUsage
    //
    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.setPreservesCFG();
    }
    
  private:
    // doADCE() - Run the Aggressive Dead Code Elimination algorithm, returning
    // true if the function was modified.
    //
    bool doADCE();
  };
}  // End of anonymous namespace

char ADCE::ID = 0;
static RegisterPass<ADCE> X("mp4-adce", "Aggressive Dead Code Elimination (MP4)",
			    false /* Only looks at CFG? */,
			    false /* Analysis Pass? */);

// Implement ADCE algorithm here
bool ADCE::doADCE()
{
  return false;
}
