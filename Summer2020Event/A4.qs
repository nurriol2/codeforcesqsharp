namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    operation SolveA4 (unitary : ((Double, Qubit) => Unit is Adj+Ctl)) : Int {

        mutable answer = -1;

        let theta = 2.0*PI();

        using(qs=Qubit[2]){

            X(qs[0]);
            H(qs[0]);
            
            (Controlled unitary)([qs[0]], (theta, qs[1]));
            (Controlled X)([qs[0]], qs[1]);

            //undo the bell state
            CNOT(qs[0], qs[1]);
            H(qs[0]);

            //measure x, y
            let q0 = M(qs[0]);
            let q1 = M(qs[1]);

            //R1 if minus phi
            //RZ if plus phi
            if ((q0==Zero) and (q1==Zero)){
                set answer = 0;
            } else{
                //q0==One and q1==Zero
                set answer = 1;
            }

            ResetAll(qs);
        }

       

        return answer;
    }
}