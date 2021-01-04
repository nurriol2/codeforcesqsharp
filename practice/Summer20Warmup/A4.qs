namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation SolveA4 (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        mutable gate = -1;

        using (qs=Qubit[2]){

            unitary(qs);
            let q0 = M(qs[0]);
            let q1 = M(qs[1]);

            if (q0==q1){
                set gate = 1;
            } else{
                set gate = 0;
            }

            ResetAll(qs);
        }

        return gate;
    }
}