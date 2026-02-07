DefinitionBlock ("", "SSDT", 2, "HACK", "INI", 0x00000000)
{
    External (\_SB_.PCI0, DeviceObj)
    External (\_SB_.PCI0.RP04.D3HT, FieldUnitObj)
    External (\_SB_.PCI0.XINI, MethodObj)
    External (RP4D, FieldUnitObj)

    Scope (\_SB.PCI0)
    {
        Method (_INI, 0, Serialized)  // _INI: Initialize
        {
            ^XINI ()
            If (_OSI ("Darwin"))
            {
                Store (0x03, ^RP04.D3HT)
                Store (One, RP4D)
            }
        }
    }
}
