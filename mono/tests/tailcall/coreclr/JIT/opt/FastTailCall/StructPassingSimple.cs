// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.
using System;

// 10 byte struct
public struct A
{
    public int a;
    public int b;
    public short c;
}

class TailCallStructPassingSimple
{
    // Simple tail call candidate that would be ignored on Arm64 and amd64 Unix
    // due to https://github.com/dotnet/coreclr/issues/2666
    public static int ImplicitTailCallTenByteStruct(A a, int count=1000)
    {
        if (count-- == 0)
        {
            return 100;
        }

        return ImplicitTailCallTenByteStruct(a, count);
    }

    public static int Main()
    {
        A temp = new A();
        temp.a = 50;
        temp.b = 500;
        temp.c = 62;

        int ret = ImplicitTailCallTenByteStruct(temp);
        return (ret == 100) ? 0 : ret;
    } 
}