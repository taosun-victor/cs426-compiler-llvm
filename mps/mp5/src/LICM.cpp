#include "llvm/IR/Function.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Scalar.h"
#include <iostream>

using namespace llvm;

namespace {
  class LICM : public LoopPass {
  private:
    Loop *curLoop;
    
  public:
    static char ID; // Pass identification, replacement for typeid
    LICM() : LoopPass(ID) {}
    virtual bool runOnLoop(Loop *L, LPPassManager &LPM) {
	curLoop = L;
	return doLICM();
    }
    
    /// This transformation requires natural loop information & requires that
    /// loop preheaders be inserted into the CFG...
    // 
    // !!!PLEASE READ getLoopAnalysisUsage(AU) defined in lib/Transforms/Utils/LoopUtils.cpp
    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesCFG();
      getLoopAnalysisUsage(AU);
    } 
    
  private:
    bool doLICM();
  };
}

char LICM::ID = 0;
RegisterPass<LICM> X("mp4-licm", "Loop Invariant Code Motion (MP4)",
		     false /* Only looks at CFG? */,
		     false /* Analysis Pass? */);

// Implement LICM algorithm here
bool LICM::doLICM()
{
  return false;
}
