// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vcpu32.h for the primary calling header

#ifndef VERILATED_VCPU32___024ROOT_H_
#define VERILATED_VCPU32___024ROOT_H_  // guard

#include "verilated.h"


class Vcpu32__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vcpu32___024root final {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(reset,0,0);
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    VL_OUT(pc,31,0);
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vcpu32__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vcpu32___024root(Vcpu32__Syms* symsp, const char* namep);
    ~Vcpu32___024root();
    VL_UNCOPYABLE(Vcpu32___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
