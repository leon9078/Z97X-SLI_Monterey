DefinitionBlock ("", "SSDT", 2, "HACK", "XSEL", 0x00000000)
{
    External (\_SB_.PCI0.XHC_, DeviceObj)
    External (\_SB_.PCI0.XHC_.XSEM, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.XHC)
    {
        Method (XSEL, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (^XSEM ())
        }
    }
}
