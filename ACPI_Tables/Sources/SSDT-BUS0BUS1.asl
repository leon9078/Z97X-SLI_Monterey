DefinitionBlock ("", "SSDT", 2, "HACK", "BUS0BUS1", 0x00000000)
{
    External (\_SB_.PCI0.SBUS, DeviceObj)

    Scope (\_SB.PCI0.SBUS)
    {
        Device (BUS0)
        {
            Name (_CID, "smbus")  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (BUS1)
        {
            Name (_CID, "smbus")  // _CID: Compatible ID
            Name (_ADR, One)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }
}
