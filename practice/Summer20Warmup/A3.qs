namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation SolveA3 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable gate = -1;
        using(qs=Qubit[2]){
            X(qs[1]);
            H(qs[0]);
            unitary(qs[0]);
            Z(qs[0]);
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            let mes = M(qs[1]);
            if (mes==One){
                set gate = 0;
            } else{
                set gate = 1;
            }
            ResetAll(qs);
        }
        return gate;
    }
}