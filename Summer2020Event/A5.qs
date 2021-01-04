namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    operation SolveA5 (theta : Double, unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        let remainingAngle = PI()-theta;
        mutable answer = -1;

        using (q=Qubit()){
            Y(q);
            unitary(q);

        }

        return answer;
    }
}