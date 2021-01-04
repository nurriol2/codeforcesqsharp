namespace Solution{

    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    
    operation SolveC1 (qs : Qubit[]) : Unit {
        using (ancilla = Qubit()) {
            repeat {
                ApplyToEach(H, qs);
                Controlled X(qs, ancilla);
                let res = MResetZ(ancilla);
            }
            until (res == Zero)
            fixup {
                ResetAll(qs);
            }
        }
    }

}