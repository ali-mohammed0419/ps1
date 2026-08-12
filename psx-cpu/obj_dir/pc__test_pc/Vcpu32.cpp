// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vcpu32__pch.h"

//============================================================
// Constructors

Vcpu32::Vcpu32(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vcpu32__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , reset{vlSymsp->TOP.reset}
    , pc{vlSymsp->TOP.pc}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vcpu32::Vcpu32(const char* _vcname__)
    : Vcpu32(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vcpu32::~Vcpu32() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vcpu32___024root___eval_debug_assertions(Vcpu32___024root* vlSelf);
#endif  // VL_DEBUG
void Vcpu32___024root___eval_static(Vcpu32___024root* vlSelf);
void Vcpu32___024root___eval_initial(Vcpu32___024root* vlSelf);
void Vcpu32___024root___eval_settle(Vcpu32___024root* vlSelf);
void Vcpu32___024root___eval(Vcpu32___024root* vlSelf);

void Vcpu32::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vcpu32::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vcpu32___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vcpu32___024root___eval_static(&(vlSymsp->TOP));
        Vcpu32___024root___eval_initial(&(vlSymsp->TOP));
        Vcpu32___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vcpu32___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vcpu32::eventsPending() { return false; }

uint64_t Vcpu32::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vcpu32::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vcpu32___024root___eval_final(Vcpu32___024root* vlSelf);

VL_ATTR_COLD void Vcpu32::final() {
    contextp()->executingFinal(true);
    Vcpu32___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vcpu32::hierName() const { return vlSymsp->name(); }
const char* Vcpu32::modelName() const { return "Vcpu32"; }
unsigned Vcpu32::threads() const { return 1; }
void Vcpu32::prepareClone() const { contextp()->prepareClone(); }
void Vcpu32::atClone() const {
    contextp()->threadPoolpOnClone();
}
