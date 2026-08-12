// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcpu32.h for the primary calling header

#include "Vcpu32__pch.h"

void Vcpu32___024root___ctor_var_reset(Vcpu32___024root* vlSelf);

Vcpu32___024root::Vcpu32___024root(Vcpu32__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vcpu32___024root___ctor_var_reset(this);
}

void Vcpu32___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vcpu32___024root::~Vcpu32___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
