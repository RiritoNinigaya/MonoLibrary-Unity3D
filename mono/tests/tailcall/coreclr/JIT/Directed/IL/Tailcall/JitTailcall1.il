// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib { }

.assembly jittailcall1
{
}
.class EvenOdd
{ .method static bool IsEven(int32 N)
  { .maxstack   2
    ldarg.0             // N
    ldc.i4.0
    bne.un      NonZero
    ldc.i4.1
    ret
NonZero:
    ldarg.0
    ldc.i4.1
    sub
    tail. call  bool EvenOdd::IsOdd(int32)
    ret
  } // end of method 'EvenOdd::IsEven'

  .method static bool IsOdd(int32 N)
  { .maxstack   2
    ldarg       N
    ldc.i4.0
    bne.un      NonZero
    ldc.i4.0
    ret
NonZero:
    ldarg       N
    ldc.i4.1
    sub
    tail. call  bool EvenOdd::IsEven(int32)
    ret
  } // end of method 'EvenOdd::IsOdd'

  .method static void Test(int32 N)
  { .maxstack   1
    ldarg       N
    call        void [mscorlib]System.Console::Write(int32)
    ldstr       " is "
    call        void [mscorlib]System.Console::Write(class [mscorlib]System.String)
    ldarg       N
    call        bool EvenOdd::IsEven(int32)
    brfalse     LoadOdd
    ldstr       "even"
Print:
    tail. call  void [mscorlib]System.Console::WriteLine(class [mscorlib]System.String)
    ret
LoadOdd:
    ldstr       "odd"
    br          Print
  } // end of method 'EvenOdd::Test'  

//Global method

.method public static int32 main()
{ .entrypoint
  .maxstack     1
  ldc.i4.5
  call          void EvenOdd::Test(int32)
  ldc.i4        0
  ret
} // end of global method 'main'
} // end of class 'EvenOdd'
