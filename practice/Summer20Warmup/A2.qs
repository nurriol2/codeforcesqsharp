namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    
    operation SolveA2 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable gate = -1;

        using (anc=Qubit()){
            H(anc);
            unitary(anc);
            H(anc);
            let mes = M(anc);

            if (mes==Zero){
                //was I
                set gate = 0;
            } else{
                //was Z
                set gate = 1;
            }


            Reset(anc);
        }

        return gate;
    }
}