namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    operation SolveA3 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable answer = -1;

        using (q=Qubit()){
            unitary(q);
            X(q);
            unitary(q);
            
            set answer = (M(q)==Zero) ? 0 | 1;

            Reset(q);
        }

        return answer;
    }
}