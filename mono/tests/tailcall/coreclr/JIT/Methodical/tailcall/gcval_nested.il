// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib { }
.assembly gcval { }
.namespace JitTest
{
  .class private sequential ansi sealed beforefieldinit LargeVT
         extends [mscorlib]System.ValueType
  {
    .field private int32[] 'value'
    .field private valuetype JitTest.LargeVT[] next
    
    .method private hidebysig static value class JitTest.LargeVT 
            callee(int32 retcode) il managed
    {
      // Code size       33 (0x21)
      .maxstack  99
      .locals (value class JitTest.LargeVT lv)
      ldloca lv
      initobj JitTest.LargeVT
      ldloca lv
      
      ldc.i4.1
      newarr value class JitTest.LargeVT
      dup
      ldc.i4.0
      ldelema value class JitTest.LargeVT
      dup
      initobj    JitTest.LargeVT
      ldc.i4.1
      newarr     [mscorlib]System.Int32
      dup
      ldc.i4.0
      ldarg.0
      stelem.i4
      stfld      int32[] JitTest.LargeVT::'value'

      stfld      valuetype JitTest.LargeVT[] JitTest.LargeVT::next
      ldloc.0
      ret
    } // end of method LargeVT::callee

    .method private hidebysig static value class JitTest.LargeVT 
            caller(int32 retcode) il managed
    {
		// Code size       11 (0xb)
	      .maxstack  99
		ldarg.0
		tail. call value class JitTest.LargeVT JitTest.LargeVT::callee(int32)
		ret
    } // end of method LargeVT::caller

    .method private hidebysig static int32
            Main() il managed
    {
      .entrypoint
      // Code size       46 (0x2e)
      .maxstack  99
      .locals (int32 V_0,
               int32 V_1,
               value class JitTest.LargeVT V_2)
      ldc.i4.s   100
      call       value class JitTest.LargeVT JitTest.LargeVT::caller(int32)
      stloc.2
      ldloca.s   V_2
      ldfld      value class JitTest.LargeVT[] JitTest.LargeVT::next
      ldc.i4.0
      ldelema value class JitTest.LargeVT
      ldfld      int32[] JitTest.LargeVT::'value'
      
      ldc.i4.0
      ldelem.i4
      stloc.0
      ldloc.0
      ldc.i4.s   100
      beq.s      IL_001e

      ldstr      "failed"
      br.s       IL_0023

      IL_001e:  ldstr      "passed"
      IL_0023:  call       void [mscorlib]System.Console::WriteLine(class System.String)
      ldloc.0
      stloc.1
      ldloc.1

// convert success:100 to success:0
	dup
	ldc.i4 100
	bne.un exit
	pop
	ldc.i4 0
exit:

      ret
    } // end of method LargeVT::Main

  } // end of class LargeVT

} // end of namespace JitTest
