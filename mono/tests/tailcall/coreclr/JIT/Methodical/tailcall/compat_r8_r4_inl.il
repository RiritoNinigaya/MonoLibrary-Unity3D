// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib { }
.assembly compat_r8_r4_inl { }
.namespace JitTest
{
  .class private auto ansi beforefieldinit Test
         extends [mscorlib]System.Object
  {
    .method private hidebysig static 
            float64 Method1() il managed
    {
      .maxstack  8
      IL_0000:  ldc.r8     10.
      IL_0009:  ret
    } 

    .method private hidebysig static 
            float32 Method2() il managed
    {
      .maxstack  8
      IL_0000:  tail.
      IL_0002:  call       float64 JitTest.Test::Method1()
      IL_0007:  ret
    } 

    .method private hidebysig static 
            int32 Main() il managed
    {
      .entrypoint
      .maxstack  8
      .locals (int32 V_0)
      IL_0000:  call       float32 JitTest.Test::Method2()
      IL_0005:  dup
      IL_0006:  ldc.r4     10.
      IL_000b:  beq.s      IL_0016

      IL_000d:  call       void [mscorlib]System.Console::WriteLine(float32)
      IL_0012:  ldc.i4.1
      IL_0013:  stloc.0
      IL_0014:  br.s       IL_0026

      IL_0016:  pop
      IL_0017:  ldstr      "passed"
      IL_001c:  call       void [mscorlib]System.Console::WriteLine(class System.String)
      IL_0021:  ldc.i4.s   100
      IL_0023:  stloc.0
      IL_0024:  br.s       IL_0026

      IL_0026:  ldloc.0

// convert success:100 to success:0
	dup
	ldc.i4 100
	bne.un exit
	pop
	ldc.i4 0
exit:

      IL_0027:  ret
    } 

    .method public hidebysig specialname rtspecialname 
            instance void .ctor() il managed
    {
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0006:  ret
    } 
  } 
} 
