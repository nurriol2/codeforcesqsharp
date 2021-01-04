namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation SolveE1 (p : Int, inputRegister : LittleEndian) : Unit is Adj+Ctl {
        for (i in 1..p){
            QFTLE(inputRegister);
        }
    }
}