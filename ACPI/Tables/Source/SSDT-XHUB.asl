DefinitionBlock ("", "SSDT", 2, "HACK", "XHUB", 0x00000000)
{
    External (\_SB_.PCI0.XHC_, DeviceObj)
    External (\_SB_.PCI0.XHC_.RHUB, DeviceObj)

    Scope (\_SB.PCI0.XHC.RHUB)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (0x0F)
        }
    }

    Scope (\)
    {
        Name (UHSD, Package (0x0E)
        {
            Zero, 
            Zero, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            Zero, 
            One, 
            One
        })
        Name (USSD, Package (0x06)
        {
            Zero, 
            Zero, 
            One, 
            One, 
            One, 
            One
        })
        Method (GUPC, 2, Serialized)
        {
            Name (PCKG, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Store (Arg0, Index (PCKG, Zero))
            Store (Arg1, Index (PCKG, One))
            Return (PCKG)
        }

        Method (GPLD, 2, Serialized)
        {
            Name (PCKG, Package (0x01)
            {
                Buffer (0x10) {}
            })
            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
            Store (0x02, REV)
            CreateField (DerefOf (Index (PCKG, Zero)), 0x07, One, ICOL)
            Store (One, ICOL)
            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
            Store (Arg0, VISI)
            CreateField (DerefOf (Index (PCKG, Zero)), 0x43, 0x03, PANL)
            Store (0x06, PANL)
            CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
            Store (0x07, SHAP)
            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
            Store (Arg1, GPOS)
            Return (PCKG)
        }
    }

    Scope (\_SB.PCI0.XHC)
    {
        Device (XHUB)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Device (HS01)
            {
                Name (_ADR, One)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, Zero)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, Zero)), One))
                }
            }

            Device (HS02)
            {
                Name (_ADR, 0x02)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, One)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, One)), 0x02))
                }
            }

            Device (HS03)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x02)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x02)), 0x03))
                }
            }

            Device (HS04)
            {
                Name (_ADR, 0x04)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x03)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x03)), 0x04))
                }
            }

            Device (HS05)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x04)), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x04)), 0x05))
                }
            }

            Device (HS06)
            {
                Name (_ADR, 0x06)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x05)), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x05)), 0x06))
                }
            }

            Device (HS07)
            {
                Name (_ADR, 0x07)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x06)), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x06)), 0x07))
                }
            }

            Device (HS08)
            {
                Name (_ADR, 0x08)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x07)), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x07)), 0x08))
                }
            }

            Device (HS09)
            {
                Name (_ADR, 0x09)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x08)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x08)), 0x09))
                }
            }

            Device (HS10)
            {
                Name (_ADR, 0x0A)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x09)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x09)), 0x0A))
                }
            }

            Device (HS11)
            {
                Name (_ADR, 0x0B)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x0A)), 0xFF))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x0A)), 0x0B))
                }
            }

            Device (HS12)
            {
                Name (_ADR, 0x0C)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x0B)), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x0B)), 0x0C))
                }
            }

            Device (HS13)
            {
                Name (_ADR, 0x0D)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x0C)), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x0C)), 0x0D))
                }
            }

            Device (HS14)
            {
                Name (_ADR, 0x0E)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (UHSD, 0x0D)), Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (UHSD, 0x0D)), 0x0E))
                }
            }

            Device (SSP1)
            {
                Name (_ADR, 0x10)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (USSD, Zero)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (USSD, Zero)), One))
                }
            }

            Device (SSP2)
            {
                Name (_ADR, 0x11)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (USSD, One)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (USSD, One)), 0x02))
                }
            }

            Device (SSP3)
            {
                Name (_ADR, 0x12)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (USSD, 0x02)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (USSD, 0x02)), 0x03))
                }
            }

            Device (SSP4)
            {
                Name (_ADR, 0x13)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (USSD, 0x03)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (USSD, 0x03)), 0x04))
                }
            }

            Device (SSP5)
            {
                Name (_ADR, 0x14)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (USSD, 0x04)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (USSD, 0x04)), 0x05))
                }
            }

            Device (SSP6)
            {
                Name (_ADR, 0x15)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (DerefOf (Index (USSD, 0x05)), 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (GPLD (DerefOf (Index (USSD, 0x05)), 0x06))
                }
            }
        }
    }
}
