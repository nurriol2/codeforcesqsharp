namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation SolveA1 (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        
        mutable answer = -1;
 
        using (qs=Qubit[2]){
            X(qs[0]);
            unitary(qs);
            CNOT(qs[0], qs[1]);
 
            let mes = M(qs[1]);
            if (mes==One){
                set answer = 1;
            } else{
                set answer = 0;
            }
 
            ResetAll(qs);
        }
 
        return answer;
    }
}