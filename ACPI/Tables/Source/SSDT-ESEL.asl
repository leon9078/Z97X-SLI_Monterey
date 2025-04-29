DefinitionBlock ("", "SSDT", 2, "HACK", "ESEL", 0x00000000)
{
    External (\_SB_.PCI0.XHC_, DeviceObj)
    External (\_SB_.PCI0.XHC_.ESEM, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.XHC)
    {
        Method (ESEL, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (^ESEM ())
        }
    }
}
