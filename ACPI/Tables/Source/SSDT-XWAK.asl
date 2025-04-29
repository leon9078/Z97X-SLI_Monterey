DefinitionBlock ("", "SSDT", 2, "HACK", "XWAK", 0x00000000)
{
    External (\_SB_.PCI0.XHC_, DeviceObj)
    External (\_SB_.PCI0.XHC_.XWAJ, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.XHC)
    {
        Method (XWAK, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (^XWAJ ())
        }
    }
}
