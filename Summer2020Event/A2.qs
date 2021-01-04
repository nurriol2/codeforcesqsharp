namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation SolveA2 (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        mutable answer = -1;

        using (qs=Qubit[2]){
            X(qs[1]);
            ApplyToEach(H, qs);
            unitary(qs);
            ApplyToEach(H, qs);
            CNOT(qs[1], qs[0]);
            X(qs[0]);
            unitary(qs);

            let q0 = M(qs[0]);
            let q1 = M(qs[1]);

            if ((q0==Zero) and (q1==Zero)){
                //SWAP
                set answer = 3;
            } elif ((q0==One) and (q1==One)){
                //CNOT 2 to 1
                set answer = 2;
            } elif ((q0==One) and (q1==Zero)){
                //CNOT 1 to 2
                set answer = 1;
            } else{
                //IDENTITY
                set answer = 0;
            }

            ResetAll(qs);
        }

        return answer;
    }
}