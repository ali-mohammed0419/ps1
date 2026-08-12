// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VCPU32__SYMS_H_
#define VERILATED_VCPU32__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vcpu32.h"

// INCLUDE MODULE CLASSES
#include "Vcpu32___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vcpu32__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vcpu32* const __Vm_modelp;
    bool __Vm_activity = false;  ///< Used by trace routines to determine change occurred
    uint32_t __Vm_baseCode = 0;  ///< Used by trace routines when tracing multiple models
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vcpu32___024root               TOP;

    // CONSTRUCTORS
    Vcpu32__Syms(VerilatedContext* contextp, const char* namep, Vcpu32* modelp);
    ~Vcpu32__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
