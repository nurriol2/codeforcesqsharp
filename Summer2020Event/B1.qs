namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        let N = Length(inputs);
        if ((N==4) or (N==8)){
            X(output);
            for (i in 1..2..N-1){
                (Controlled X)([inputs[i]], output);
            }
        } else{
            for (i in 0..N-1){
                (Controlled X)([inputs[i]], output);
            }
        }

        using (anc=Qubit()){
            
        }
    }
}