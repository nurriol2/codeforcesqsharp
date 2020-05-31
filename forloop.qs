namespace Explore{
  open Microsoft.Quantum.Intrinsic;

  operation MainForLoop() : Unit{
    for (i in 1..10){
      Message($"Printing {i}");
    }
  }
}
