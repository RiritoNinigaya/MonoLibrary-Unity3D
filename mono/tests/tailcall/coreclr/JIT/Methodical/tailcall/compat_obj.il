// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib { }
.assembly compat_obj { }
.namespace JitTest
{
  .class public auto ansi beforefieldinit BaseClass
         extends [mscorlib]System.Object
  {
    .method public hidebysig  static 
            class JitTest.BaseClass  caller(bool which) il managed
    {
      // Code size       18 (0x12)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  brfalse.s  IL_000a

      IL_0003:  newobj     instance void JitTest.BaseClass::.ctor()
      IL_0008:  br.s       IL_0011

      IL_000a:  tail.
      IL_000c:  call       class JitTest.DerivedClass JitTest.DerivedClass::callee()
      IL_0011:  ret
    } // end of method BaseClass::caller

    .method public hidebysig  specialname rtspecialname 
            instance void .ctor() il managed
    {
      // Code size       7 (0x7)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0006:  ret
    } // end of method BaseClass::.ctor

  } // end of class BaseClass

  .class public auto ansi beforefieldinit DerivedClass
         extends JitTest.BaseClass
  {
    .method public hidebysig  static 
            class JitTest.DerivedClass callee() il managed
    {
      // Code size       6 (0x6)
      .maxstack  8
      IL_0000:  newobj     instance void JitTest.DerivedClass::.ctor()
      IL_0005:  ret
    } // end of method DerivedClass::callee

    .method public hidebysig  static 
            int32 Main() il managed
    {
      .entrypoint
      // Code size       39 (0x27)
      .maxstack  99
      .locals (int32 V_0)
      IL_0000:  ldc.i4.0
      IL_0001:  call       class JitTest.BaseClass JitTest.BaseClass::caller(bool)
      IL_0006:  call       void [mscorlib]System.Console::WriteLine(class System.Object)
      IL_000b:  ldc.i4.1
      IL_000c:  call       class JitTest.BaseClass JitTest.BaseClass::caller(bool)
      IL_0011:  call       void [mscorlib]System.Console::WriteLine(class System.Object)
      IL_0016:  ldstr      "passed"
      IL_001b:  call       void [mscorlib]System.Console::WriteLine(class System.String)
      IL_0020:  ldc.i4.s   100
      IL_0022:  stloc.0
      IL_0023:  br.s       IL_0025

      IL_0025:  ldloc.0

// convert success:100 to success:0
	dup
	ldc.i4 100
	bne.un exit
	pop
	ldc.i4 0
exit:

      IL_0026:  ret
    } // end of method DerivedClass::Main

    .method public hidebysig  specialname rtspecialname 
            instance void .ctor() il managed
    {
      // Code size       7 (0x7)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void JitTest.BaseClass::.ctor()
      IL_0006:  ret
    } // end of method DerivedClass::.ctor

  } // end of class DerivedClass

} // end of namespace JitTest
