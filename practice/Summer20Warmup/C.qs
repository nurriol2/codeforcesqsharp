namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Canon;


    //changed operation name to avoid namespace conflict
    operation SolveC (qs : Qubit[]) : Unit {
        
        //rotation 
        //gamma needs to include the negative sign
        let gamma = (ArcSin(Sqrt(2.0)/Sqrt(3.0))/2.0);
        let paulis = [PauliY];
        Exp(paulis, gamma, [qs[0]]);

        //controlled hadamard
        Controlled H([qs[0]], qs[1]);
        //current state (1/sqrt(3))*[|10> + |11> + |00>]
        
        //get the |01> state to show up
        (ControlledOnInt(0, X))([qs[0]], qs[1]);
        
    }
}