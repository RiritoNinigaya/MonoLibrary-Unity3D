.assembly extern mscorlib { }

.assembly taili1 { }

.class A extends [mscorlib]System.Object {
.method public hidebysig static int32 taili1() cil managed noinlining {
.entrypoint
.maxstack 3
.locals init (uint8 V_0)
ldloca.s V_0
conv.u
ldc.i4.0
conv.i8
ldc.i4.8
call int32 A::taili2(uint8*, int64, int32)
ret
}
.method private hidebysig static int32 taili2(uint8* root_stack, int64 diff_stack, int32 counter) cil managed noinlining {
.maxstack 4
.locals init (uint8 V_0)
ldarg.2
ldc.i4.0
ble.s IL_0016
ldarg.0
ldloca.s V_0
conv.u
ldarg.0
sub
ldc.i4.1
div
conv.i8
ldarg.2
ldc.i4.1
sub
ldftn int32 A::taili2(uint8*, int64, int32)
tail. calli int32 (uint8*, int64, int32)
ret
IL_0016: ldarg.0
ldloca.s V_0
conv.u
ldarg.1
ldstr "taili1"
call int32 A::check(uint8*, uint8*, int64, string)
ret
}
.method private hidebysig static int32 check(uint8* root_stack, uint8* local, int64 diff_stack, string name) cil managed noinlining {
.maxstack 8
ldarg.1
ldarg.0
sub
ldc.i4.1
div
conv.i8
ldarg.2
beq.s IL_0026
ldstr "{0} failure {1}"
ldarg.3
ldarg.0
ldarg.1
sub
ldc.i4.1
div
conv.i8
box [mscorlib]System.Int64
call string [mscorlib]System.String::Format(string, object, object)
call void [mscorlib]System.Console::WriteLine(string)
ldc.i4.1
ret
IL_0026: ldstr "{0} success"
ldarg.3
call string [mscorlib]System.String::Format(string, object)
call void [mscorlib]System.Console::WriteLine(string)
ldc.i4.0
ret
}
.method private hidebysig static int32 check(int64 root_stack, uint8* local, int64 diff_stack, string name) cil managed noinlining {
.maxstack 8
ldarg.0
conv.u
ldarg.1
ldarg.2
ldarg.3
call int32 A::check(uint8*, uint8*, int64, string)
ret
}
}
