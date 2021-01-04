namespace Solution{
    open Microsoft.Quantum.Intrinsic;

    operation SolveA1(unitary : (Qubit => Unit is Adj+Ctl)) : Int{
        //initially don't know the gate
        mutable gate = -1;

        //allocate anc=|0>
        using (anc=Qubit()){
            //do U|0>
            let phi1 = unitary(anc);
            
            //measure the outcome of U|0>
            let phi1Measurement = M(anc);
            
            //if U==I
            //U|0>=I|0>=|0>
            //elif U==X
            //UU|0>=X|0>=|1>
            if (phi1Measurement==Zero){
                set gate = 0;
            } else{
                set gate = 1;
            }

            Reset(anc);
        }

        return gate;
    }
}