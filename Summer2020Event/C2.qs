namespace Solution {

    //this is the circuit I'm trying to implement
    //https://bit.ly/3hQS1CK
    
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation SolveC2 (qs : Qubit[], parity : Int) : Unit {
        let N = Length(qs);
        
        if (N==1){
            if (parity==1){
                ApplyToEach(X, qs);
            } else{
                ApplyToEach(I, qs);
            }
        } else{
           if (parity==1){
               ApplyToEach(X, qs);
               for (i in 0..N-2){
                   H(qs[i]);
                   for (j in 0..N-1){
                       (Controlled X)([qs[i]], qs[j]);
                   }
               }
           } else{
               for (i in 0..N-2){
                   H(qs[i]);
                   for (j in 0..N-1){
                       (Controlled X)([qs[i]], qs[j]);
                   }
               }
           }
        }
    }
}