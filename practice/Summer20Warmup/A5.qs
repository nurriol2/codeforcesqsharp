namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation SolveA5 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable gate = -1;

        using (qs=Qubit[2]){
            
            H(qs[0]);
            Controlled unitary([qs[0]], qs[1]);
            CNOT(qs[0], qs[1]);
            CNOT(qs[0], qs[1]);
            H(qs[0]);
            let q0 = M(qs[0]);
            let q1 = M(qs[1]);
            if ((q0==Zero) and (q1==Zero)){
                set gate = 0;
            } else{
                set gate = 1;
            }

            ResetAll(qs);
        }

        return gate;
    }
}