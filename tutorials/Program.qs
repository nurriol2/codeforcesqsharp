//creating a random number generator using Q#

namespace Qrng{
  open Microsoft.Quantum.Convert;
  open Microsoft.Quantum.Math;
  open Microsoft.Quantum.Measurement;
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Intrinsic;


  /// # Summary #
  /// Measure a |+> quibt
  operation SampleQuantumRandomNumberGenerator() : Result{
    //on allocation qubit is in |0>
    using (q=Qubit()){
      H(q);
      //when qubit is de-allocated must be set back to |0>, else runtime error
      return MResetZ(q);
    }
  }

  /// # Summary #
  ///
  operation SampleRandomNumberInRange(max:Int) : Int{
    //create a Result array that can change its size
    mutable bits = new Result[0];
    //not sure about syntax in for loop here
    for (idxBit in 1..BitSizeI(max)){
      set bits += [SampleQuantumRandomNumberGenerator()];
    }
    //converting `Zero` and `One` to integers
    let sample = ResultArrayAsInt(bits);
    //always false so return sample?
    return sample > max ? SampleRandomNumberInRange(max) | sample;
  }

  //EntryPoint not needed because simulating through ipynb
  //@EntryPoint()
  operation SampleRandomNumber() : Int{
    let max = 50;
    Message($"Sampling a random number between 0 and {max}:  ");
    return SampleRandomNumberInRange(max);
  }


}
