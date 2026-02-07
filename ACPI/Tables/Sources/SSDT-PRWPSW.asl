DefinitionBlock ("", "SSDT", 2, "HACK", "PRWPSW", 0x00000000)
{
    External (\_SB_.PCI0.EHC1, DeviceObj)
    External (\_SB_.PCI0.EHC1.PMEE, FieldUnitObj)
    External (\_SB_.PCI0.EHC1.XPRW, MethodObj)
    External (\_SB_.PCI0.EHC2, DeviceObj)
    External (\_SB_.PCI0.EHC2.PMEE, FieldUnitObj)
    External (\_SB_.PCI0.EHC2.XPRW, MethodObj)
    External (\_SB_.PCI0.XHC_, DeviceObj)
    External (\_SB_.PCI0.XHC_.XPRW, MethodObj)
    External (XHCI, FieldUnitObj)

    Scope (\_SB.PCI0.EHC1)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (LAnd (_OSI ("Darwin"), LEqual (XHCI, One)))
            {
                Store (^XPRW (), Local0)
                Store (Zero, Index (Local0, One))
                Return (Local0)
            }

            Return (^XPRW ())
        }

        Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
        {
            If (LAnd (_OSI ("Darwin"), LNotEqual (XHCI, Zero)))
            {
                Store (Zero, ^PMEE)
            }
        }
    }

    Scope (\_SB.PCI0.EHC2)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (LAnd (_OSI ("Darwin"), LEqual (XHCI, One)))
            {
                Store (^XPRW (), Local0)
                Store (Zero, Index (Local0, One))
                Return (Local0)
            }

            Return (^XPRW ())
        }

        Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
        {
            If (LAnd (_OSI ("Darwin"), LNotEqual (XHCI, Zero)))
            {
                Store (Zero, ^PMEE)
            }
        }
    }

    Scope (\_SB.PCI0.XHC)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (LAnd (_OSI ("Darwin"), LEqual (XHCI, Zero)))
            {
                Store (^XPRW (), Local0)
                Store (Zero, Index (Local0, One))
                Return (Local0)
            }

            Return (^XPRW ())
        }

        Method (PS9X, 0, NotSerialized)
        {
        }
    }
}
