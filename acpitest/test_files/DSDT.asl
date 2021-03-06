/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140926-64 [Oct  1 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of tests/acpi_tables/DSDT.acpi, Wed May 25 23:41:53 2016
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00010FD6 (69590)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xFA
 *     OEM ID           "PTLTD "
 *     OEM Table ID     "Custom  "
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x03000001 (50331649)
 */
DefinitionBlock ("tests/acpi_tables/DSDT.aml", "DSDT", 1, "PTLTD ", "Custom  ", 0x06040000)
{

    External (_SB_.L1M0.L0MX, IntObj)
    External (_SB_.L1M1.L0MX, IntObj)
    External (_SB_.L1M2.L0MX, IntObj)
    External (_SB_.L1M3.L0MX, IntObj)
    External (_SB_.L1M4.L0MX, IntObj)
    External (_SB_.L1M5.L0MX, IntObj)
    External (_SB_.L1M6.L0MX, IntObj)
    External (_SB_.L1M7.L0MX, IntObj)

    Name (\GPIC, 0x00)
    Method (\_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC) /* \GPIC */
    }

    Scope (_SB)
    {
        Method (STRC, 2, NotSerialized)
        {
            If (LNotEqual (SizeOf (Arg0), SizeOf (Arg1)))
            {
                Return (Zero)
            }

            Add (SizeOf (Arg0), 0x01, Local0)
            Name (BUF0, Buffer (Local0) {})
            Name (BUF1, Buffer (Local0) {})
            Store (Arg0, BUF0) /* \_SB_.STRC.BUF0 */
            Store (Arg1, BUF1) /* \_SB_.STRC.BUF1 */
            While (Local0)
            {
                Decrement (Local0)
                If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                    BUF1, Local0))))
                {
                    Return (Zero)
                }
            }

            Return (One)
        }

        OperationRegion (OEMD, SystemMemory, 0xBFEFFE45, 0x00000078)
        Field (OEMD, AnyAcc, NoLock, Preserve)
        {
            Offset (0x24), 
            CCAP,   32, 
            ECFG,   32, 
            PCHS,   32, 
            PCHE,   32, 
            P64S,   64, 
            P64E,   64, 
            P64L,   64, 
            VMGC,   256, 
            LDDV,   32, 
            POSC,   32, 
            SIOC,   32
        }

        Name (TOOS, 0x00)
        Name (FLAG, 0x00)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (LNotEqual (FLAG, 0x00))
            {
                Return (Zero)
            }

            Store (0x01, FLAG) /* \_SB_.FLAG */
            If (CondRefOf (\_OSI, Local0))
            {
                If (\_OSI ("Linux"))
                {
                    Store (0x0F00, TOOS) /* \_SB_.TOOS */
                }
                Else
                {
                    If (\_OSI ("Windows 2006"))
                    {
                        Store (0x0C00, TOOS) /* \_SB_.TOOS */
                    }
                    Else
                    {
                        If (\_OSI ("Windows 2001.1 SP1"))
                        {
                            Store (0x0A00, TOOS) /* \_SB_.TOOS */
                        }
                        Else
                        {
                            If (\_OSI ("Windows 2001.1"))
                            {
                                Store (0x0900, TOOS) /* \_SB_.TOOS */
                            }
                            Else
                            {
                                If (\_OSI ("Windows 2001 SP2"))
                                {
                                    Store (0x0700, TOOS) /* \_SB_.TOOS */
                                }
                                Else
                                {
                                    If (\_OSI ("Windows 2001 SP1"))
                                    {
                                        Store (0x0600, TOOS) /* \_SB_.TOOS */
                                    }
                                    Else
                                    {
                                        If (\_OSI ("Windows 2001"))
                                        {
                                            Store (0x0500, TOOS) /* \_SB_.TOOS */
                                        }
                                        Else
                                        {
                                            If (\_OSI ("Windows 2000"))
                                            {
                                                Store (0x0400, TOOS) /* \_SB_.TOOS */
                                            }
                                            Else
                                            {
                                                Store (0xFE00, TOOS) /* \_SB_.TOOS */
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                If (CondRefOf (\_OS, Local0))
                {
                    If (STRC (\_OS, "Microsoft Windows NT"))
                    {
                        Store (0x0300, TOOS) /* \_SB_.TOOS */
                    }
                    Else
                    {
                        If (STRC (\_OS, "Microsoft WindowsME:Millennium Edition"))
                        {
                            Store (0x0200, TOOS) /* \_SB_.TOOS */
                        }
                        Else
                        {
                            If (STRC (\_OS, "Microsoft Windows"))
                            {
                                Store (0x0100, TOOS) /* \_SB_.TOOS */
                            }
                            Else
                            {
                                If (STRC (\_OS, "NetWare"))
                                {
                                    Store (0x0B00, TOOS) /* \_SB_.TOOS */
                                }
                                Else
                                {
                                    If (STRC (\_OS, "FreeBSD"))
                                    {
                                        Store (0x1000, TOOS) /* \_SB_.TOOS */
                                    }
                                    Else
                                    {
                                        Store (0xFD00, TOOS) /* \_SB_.TOOS */
                                    }
                                }
                            }
                        }
                    }
                }
                Else
                {
                    Store (0xFF00, TOOS) /* \_SB_.TOOS */
                }
            }

            Return (0x00)
        }

        Mutex (OEML, 0x0F)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _CID: Compatible ID
            Name (_BBN, 0x00)  // _BBN: BIOS Bus Number
            Name (_ADR, 0x00)  // _ADR: Address
            OperationRegion (REGS, PCI_Config, 0x50, 0x30)
            Field (REGS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x09), 
                PAM0,   8, 
                PAM1,   8, 
                PAM2,   8, 
                PAM3,   8, 
                PAM4,   8, 
                PAM5,   8, 
                PAM6,   8, 
                DRB0,   8, 
                DRB1,   8, 
                DRB2,   8, 
                DRB3,   8, 
                DRB4,   8, 
                DRB5,   8, 
                DRB6,   8, 
                DRB7,   8, 
                    ,   6, 
                HEN,    2, 
                Offset (0x23), 
                T_EN,   1, 
                T_SZ,   2, 
                Offset (0x2A), 
                CRST,   1
            }

            OperationRegion (RE00, PCI_Config, 0xD8, 0x04)
            Field (RE00, DWordAcc, NoLock, Preserve)
            {
                OEMR,   32
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    0x00,, )
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xF0000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0EC00000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFEFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF200,             // Length
                    0x00,, , TypeStatic)
            })
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Store (Zero, Local1)
                If (T_EN)
                {
                    ShiftLeft (0x01, Add (T_SZ, 0x11), Local1)
                }

                CreateDWordField (RSRC, \_SB.PCI0._Y00._MIN, HLMN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y00._MAX, HLMX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y00._LEN, HLLN)  // _LEN: Length
                Store (PCHS, HLMN) /* \_SB_.PCI0._CRS.HLMN */
                Store (PCHE, HLMX) /* \_SB_.PCI0._CRS.HLMX */
                Add (Subtract (HLMX, HLMN), 0x01, HLLN) /* \_SB_.PCI0._CRS.HLLN */
                CreateField (RSRC, \_SB.PCI0._Y01._MIN, 0x40, H2MN)  // _MIN: Minimum Base Address
                CreateField (RSRC, \_SB.PCI0._Y01._MAX, 0x40, H2MX)  // _MAX: Maximum Base Address
                CreateField (RSRC, \_SB.PCI0._Y01._LEN, 0x40, H2LN)  // _LEN: Length
                Store (P64S, H2MN) /* \_SB_.PCI0._CRS.H2MN */
                Store (P64E, H2MX) /* \_SB_.PCI0._CRS.H2MX */
                Store (P64L, H2LN) /* \_SB_.PCI0._CRS.H2LN */
                CreateBitField (RSRC, \_SB.PCI0._Y02._RW, C0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y02._MIN, C0MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y02._MAX, C0MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y02._LEN, C0LN)  // _LEN: Length
                Store (One, C0RW) /* \_SB_.PCI0._CRS.C0RW */
                If (LEqual (And (PAM1, 0x03), 0x01))
                {
                    Store (Zero, C0RW) /* \_SB_.PCI0._CRS.C0RW */
                }

                Store (Zero, C0LN) /* \_SB_.PCI0._CRS.C0LN */
                If (LNot (And (PAM1, 0x03)))
                {
                    Store (0x4000, C0LN) /* \_SB_.PCI0._CRS.C0LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y03._RW, C4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y03._MIN, C4MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y03._MAX, C4MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y03._LEN, C4LN)  // _LEN: Length
                Store (One, C4RW) /* \_SB_.PCI0._CRS.C4RW */
                If (LEqual (And (PAM1, 0x30), 0x10))
                {
                    Store (Zero, C4RW) /* \_SB_.PCI0._CRS.C4RW */
                }

                Store (Zero, C4LN) /* \_SB_.PCI0._CRS.C4LN */
                If (LNot (And (PAM1, 0x30)))
                {
                    Store (0x4000, C4LN) /* \_SB_.PCI0._CRS.C4LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y04._RW, C8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y04._MIN, C8MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y04._MAX, C8MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y04._LEN, C8LN)  // _LEN: Length
                Store (One, C8RW) /* \_SB_.PCI0._CRS.C8RW */
                If (LEqual (And (PAM2, 0x03), 0x01))
                {
                    Store (Zero, C8RW) /* \_SB_.PCI0._CRS.C8RW */
                }

                Store (Zero, C8LN) /* \_SB_.PCI0._CRS.C8LN */
                If (LNot (And (PAM2, 0x03)))
                {
                    Store (0x4000, C8LN) /* \_SB_.PCI0._CRS.C8LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y05._RW, CCRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y05._MIN, CCMN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y05._MAX, CCMX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y05._LEN, CCLN)  // _LEN: Length
                Store (One, CCRW) /* \_SB_.PCI0._CRS.CCRW */
                If (LEqual (And (PAM2, 0x30), 0x10))
                {
                    Store (Zero, CCRW) /* \_SB_.PCI0._CRS.CCRW */
                }

                Store (Zero, CCLN) /* \_SB_.PCI0._CRS.CCLN */
                If (LNot (And (PAM2, 0x30)))
                {
                    Store (0x4000, CCLN) /* \_SB_.PCI0._CRS.CCLN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y06._RW, D0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y06._MIN, D0MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y06._MAX, D0MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y06._LEN, D0LN)  // _LEN: Length
                Store (One, D0RW) /* \_SB_.PCI0._CRS.D0RW */
                If (LEqual (And (PAM3, 0x03), 0x01))
                {
                    Store (Zero, D0RW) /* \_SB_.PCI0._CRS.D0RW */
                }

                Store (Zero, D0LN) /* \_SB_.PCI0._CRS.D0LN */
                If (LNot (And (PAM3, 0x03)))
                {
                    Store (0x4000, D0LN) /* \_SB_.PCI0._CRS.D0LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y07._RW, D4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y07._MIN, D4MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y07._MAX, D4MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y07._LEN, D4LN)  // _LEN: Length
                Store (One, D4RW) /* \_SB_.PCI0._CRS.D4RW */
                If (LEqual (And (PAM3, 0x30), 0x10))
                {
                    Store (Zero, D4RW) /* \_SB_.PCI0._CRS.D4RW */
                }

                Store (Zero, D4LN) /* \_SB_.PCI0._CRS.D4LN */
                If (LNot (And (PAM3, 0x30)))
                {
                    Store (0x4000, D4LN) /* \_SB_.PCI0._CRS.D4LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y08._RW, D8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y08._MIN, D8MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y08._MAX, D8MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y08._LEN, D8LN)  // _LEN: Length
                Store (One, D8RW) /* \_SB_.PCI0._CRS.D8RW */
                If (LEqual (And (PAM4, 0x03), 0x01))
                {
                    Store (Zero, D8RW) /* \_SB_.PCI0._CRS.D8RW */
                }

                Store (Zero, D8LN) /* \_SB_.PCI0._CRS.D8LN */
                If (LNot (And (PAM4, 0x03)))
                {
                    Store (0x4000, D8LN) /* \_SB_.PCI0._CRS.D8LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y09._RW, DCRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y09._MIN, DCMN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y09._MAX, DCMX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y09._LEN, DCLN)  // _LEN: Length
                Store (One, DCRW) /* \_SB_.PCI0._CRS.DCRW */
                If (LEqual (And (PAM4, 0x30), 0x10))
                {
                    Store (Zero, DCRW) /* \_SB_.PCI0._CRS.DCRW */
                }

                Store (Zero, DCLN) /* \_SB_.PCI0._CRS.DCLN */
                If (LNot (And (PAM4, 0x30)))
                {
                    Store (0x4000, DCLN) /* \_SB_.PCI0._CRS.DCLN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0A._RW, E0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0A._MIN, E0MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y0A._MAX, E0MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y0A._LEN, E0LN)  // _LEN: Length
                Store (One, E0RW) /* \_SB_.PCI0._CRS.E0RW */
                If (LEqual (And (PAM5, 0x03), 0x01))
                {
                    Store (Zero, E0RW) /* \_SB_.PCI0._CRS.E0RW */
                }

                Store (Zero, E0LN) /* \_SB_.PCI0._CRS.E0LN */
                If (LNot (And (PAM5, 0x03)))
                {
                    Store (0x4000, E0LN) /* \_SB_.PCI0._CRS.E0LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0B._RW, E4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0B._MIN, E4MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y0B._MAX, E4MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y0B._LEN, E4LN)  // _LEN: Length
                Store (One, E4RW) /* \_SB_.PCI0._CRS.E4RW */
                If (LEqual (And (PAM5, 0x30), 0x10))
                {
                    Store (Zero, E4RW) /* \_SB_.PCI0._CRS.E4RW */
                }

                Store (Zero, E4LN) /* \_SB_.PCI0._CRS.E4LN */
                If (LNot (And (PAM5, 0x30)))
                {
                    Store (0x4000, E4LN) /* \_SB_.PCI0._CRS.E4LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0C._RW, E8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0C._MIN, E8MN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y0C._MAX, E8MX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y0C._LEN, E8LN)  // _LEN: Length
                Store (One, E8RW) /* \_SB_.PCI0._CRS.E8RW */
                If (LEqual (And (PAM6, 0x03), 0x01))
                {
                    Store (Zero, E8RW) /* \_SB_.PCI0._CRS.E8RW */
                }

                Store (Zero, E8LN) /* \_SB_.PCI0._CRS.E8LN */
                If (LNot (And (PAM6, 0x03)))
                {
                    Store (0x4000, E8LN) /* \_SB_.PCI0._CRS.E8LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0D._RW, ECRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0D._MIN, ECMN)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y0D._MAX, ECMX)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y0D._LEN, ECLN)  // _LEN: Length
                Store (One, ECRW) /* \_SB_.PCI0._CRS.ECRW */
                If (LEqual (And (PAM6, 0x30), 0x10))
                {
                    Store (Zero, ECRW) /* \_SB_.PCI0._CRS.ECRW */
                }

                Store (Zero, ECLN) /* \_SB_.PCI0._CRS.ECLN */
                If (LNot (And (PAM6, 0x30)))
                {
                    Store (0x4000, ECLN) /* \_SB_.PCI0._CRS.ECLN */
                }

                Return (RSRC) /* \_SB_.PCI0.RSRC */
            }

            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x03, 
                0x03
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (LEqual (GPIC, 0x01))
                {
                    Return (Package (0x48)
                    {
                        Package (0x04)
                        {
                            0x000FFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x000FFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x000FFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x000FFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x01, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x02, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x02, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x03, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x02, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x03, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0017FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0017FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0017FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0017FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0018FFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0018FFFF, 
                            0x01, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0018FFFF, 
                            0x02, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0018FFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x02, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x03, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                }
                Else
                {
                    Return (Package (0x48)
                    {
                        Package (0x04)
                        {
                            0x000FFFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x000FFFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x000FFFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x000FFFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0017FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0017FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0017FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0017FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0018FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0018FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0018FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0018FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            \_SB.PCI0.ISA.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x01, 
                            \_SB.PCI0.ISA.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x02, 
                            \_SB.PCI0.ISA.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x03, 
                            \_SB.PCI0.ISA.LNKD, 
                            0x00
                        }
                    })
                }
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
            }

            Device (ISA)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Device (MBRD)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x1F)  // _UID: Unique ID
                    Name (RSRC, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0100,             // Range Minimum
                            0x0100,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            _Y0E)
                        IO (Decode16,
                            0x0140,             // Range Minimum
                            0x0140,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            _Y0F)
                        IO (Decode16,
                            0x0CF0,             // Range Minimum
                            0x0CF0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (RSRC, \_SB.PCI0.ISA.MBRD._Y0E._MIN, PMMN)  // _MIN: Minimum Base Address
                        CreateWordField (RSRC, \_SB.PCI0.ISA.MBRD._Y0E._MAX, PMMX)  // _MAX: Maximum Base Address
                        And (^^^PWR.PMBA, 0xFFFFFFFE, PMMN) /* \_SB_.PCI0.ISA_.MBRD._CRS.PMMN */
                        Store (PMMN, PMMX) /* \_SB_.PCI0.ISA_.MBRD._CRS.PMMX */
                        CreateWordField (RSRC, \_SB.PCI0.ISA.MBRD._Y0F._MIN, SMMN)  // _MIN: Minimum Base Address
                        CreateWordField (RSRC, \_SB.PCI0.ISA.MBRD._Y0F._MAX, SMMX)  // _MAX: Maximum Base Address
                        And (^^^PWR.SBBA, 0xFFFFFFFE, SMMN) /* \_SB_.PCI0.ISA_.MBRD._CRS.SMMN */
                        Store (SMMN, SMMX) /* \_SB_.PCI0.ISA_.MBRD._CRS.SMMX */
                        Return (RSRC) /* \_SB_.PCI0.ISA_.MBRD.RSRC */
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer16, )
                            {4}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0001") /* EISA Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (KBC)
                {
                    Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (MOUS)
                {
                    Name (_HID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQNoFlags ()
                            {12}
                    })
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x01)  // _UID: Unique ID
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,6,7,9,10,11,14,15}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y10)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRA, 0x80, PIRA) /* \_SB_.PCI0.ISA_.PIRA */
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (RSRC, \_SB.PCI0.ISA.LNKA._Y10._INT, IRQ0)  // _INT: Interrupts
                        And (PIRA, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0) /* \_SB_.PCI0.ISA_.LNKA._CRS.IRQ0 */
                        Return (RSRC) /* \_SB_.PCI0.ISA_.LNKA.RSRC */
                    }

                    Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRA, 0x70), PIRA) /* \_SB_.PCI0.ISA_.PIRA */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,6,7,9,10,11,14,15}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y11)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRB, 0x80, PIRB) /* \_SB_.PCI0.ISA_.PIRB */
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (RSRC, \_SB.PCI0.ISA.LNKB._Y11._INT, IRQ0)  // _INT: Interrupts
                        And (PIRB, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0) /* \_SB_.PCI0.ISA_.LNKB._CRS.IRQ0 */
                        Return (RSRC) /* \_SB_.PCI0.ISA_.LNKB.RSRC */
                    }

                    Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRB, 0x70), PIRB) /* \_SB_.PCI0.ISA_.PIRB */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,6,7,9,10,11,14,15}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y12)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRC, 0x80, PIRC) /* \_SB_.PCI0.ISA_.PIRC */
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (RSRC, \_SB.PCI0.ISA.LNKC._Y12._INT, IRQ0)  // _INT: Interrupts
                        And (PIRC, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0) /* \_SB_.PCI0.ISA_.LNKC._CRS.IRQ0 */
                        Return (RSRC) /* \_SB_.PCI0.ISA_.LNKC.RSRC */
                    }

                    Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRC, 0x70), PIRC) /* \_SB_.PCI0.ISA_.PIRC */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x04)  // _UID: Unique ID
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,6,7,9,10,11,14,15}
                    })
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y13)
                            {}
                    })
                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Or (PIRD, 0x80, PIRD) /* \_SB_.PCI0.ISA_.PIRD */
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (RSRC, \_SB.PCI0.ISA.LNKD._Y13._INT, IRQ0)  // _INT: Interrupts
                        And (PIRD, 0x0F, Local0)
                        ShiftLeft (0x01, Local0, IRQ0) /* \_SB_.PCI0.ISA_.LNKD._CRS.IRQ0 */
                        Return (RSRC) /* \_SB_.PCI0.ISA_.LNKD.RSRC */
                    }

                    Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Or (Local0, And (PIRD, 0x70), PIRD) /* \_SB_.PCI0.ISA_.PIRD */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }

                        Return (0x0B)
                    }
                }

                OperationRegion (PIRX, PCI_Config, 0x60, 0x04)
                Field (PIRX, DWordAcc, NoLock, Preserve)
                {
                    AccessAs (ByteAcc, 0x00), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8
                }
            }

            Device (PWR)
            {
                Name (_ADR, 0x00070003)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, 0x40, 0x60)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    PMBA,   32, 
                    Offset (0x50), 
                    SBBA,   32
                }
            }

            Device (USB)
            {
                Name (_ADR, 0x00070002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x01
                })
            }

            Device (IDE)
            {
                Name (_ADR, 0x00070001)  // _ADR: Address
            }
        }

        Method (IVOC, 2, NotSerialized)
        {
            Store (Or (Or (ShiftLeft (0x40E9, 0x10), ShiftLeft (Arg0, 0x08
                )), Arg1), \_SB.PCI0.OEMR)
        }

        Method (VMPS, 1, NotSerialized)
        {
            Acquire (OEML, 0xFFFF)
            IVOC (0x81, Arg0)
            Store (\_SB.PCI0.OEMR, Local0)
            Release (OEML)
            Return (Local0)
        }

        Method (VMBB, 1, NotSerialized)
        {
            Acquire (OEML, 0xFFFF)
            IVOC (0x82, Arg0)
            Store (Package (0x0D)
                {
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    "VMware Virtual Battery", 
                    "", 
                    "", 
                    ""
                }, Local0)
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x00))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x01))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x02))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x03))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x04))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x05))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x06))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x07))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x08))
            Store (\_SB.PCI0.OEMR, Local1)
            Release (OEML)
            If (LNotEqual (Local1, 0x01))
            {
                Store (Package (0x0D)
                    {
                        0x00, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0x00, 
                        0xFFFFFFFF, 
                        0x00, 
                        0x00, 
                        0x00, 
                        0x00, 
                        "", 
                        "", 
                        "", 
                        ""
                    }, Local0)
            }

            Return (Local0)
        }

        Method (VMBS, 1, NotSerialized)
        {
            Acquire (OEML, 0xFFFF)
            IVOC (0x83, Arg0)
            Store (Package (0x04)
                {
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00
                }, Local0)
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x00))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x01))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x02))
            Store (\_SB.PCI0.OEMR, Index (Local0, 0x03))
            Store (\_SB.PCI0.OEMR, Local1)
            Release (OEML)
            If (LNotEqual (Local1, 0x01))
            {
                Store (Package (0x04)
                    {
                        0x00, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, Local0)
            }

            Return (Local0)
        }

        Method (VMAP, 0, NotSerialized)
        {
            Acquire (OEML, 0xFFFF)
            IVOC (0x84, 0x00)
            Store (\_SB.PCI0.OEMR, Local0)
            Store (\_SB.PCI0.OEMR, Local1)
            Release (OEML)
            If (LNotEqual (Local1, 0x01))
            {
                Store (0x01, Local0)
            }

            Return (Local0)
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (VMPS (0x01))
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (VMBB (0x01))
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Return (VMBS (0x01))
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Acquire (OEML, 0xFFFF)
                IVOC (0x87, 0x00)
                IVOC (0x88, 0x00)
                Release (OEML)
            }
        }

        Device (BAT2)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (VMPS (0x02))
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (VMBB (0x02))
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Return (VMBS (0x02))
            }
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Return (VMAP ())
            }
        }

        Method (_SWS, 0, NotSerialized)  // _SWS: System Wake Source
        {
            Return (0x08)
        }

        Method (BFEA, 0, NotSerialized)
        {
            Acquire (OEML, 0xFFFF)
            IVOC (0x89, 0x00)
            Store (\_SB.PCI0.OEMR, Local0)
            Release (OEML)
            Return (Local0)
        }

        Device (SLPB)
        {
            Name (_HID, "PNP0C0E" /* Sleep Button Device */)  // _HID: Hardware ID
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x09, 
                0x04
            })
            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (And (BFEA (), 0x01))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (0x00)
                }
            }
        }
    }

    Scope (\_GPE)
    {
        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Acquire (\_SB.OEML, 0xFFFF)
            \_SB.IVOC (0x86, 0x00)
            Store (\_SB.PCI0.OEMR, Local0)
            Release (\_SB.OEML)
            If (LNotEqual (Local0, 0x00))
            {
                Notify (\_SB.BAT1, Local0)
                Notify (\_SB.BAT2, Local0)
                Notify (\_SB.ACAD, 0x80) // Status Change
            }

            Acquire (\_SB.OEML, 0xFFFF)
            \_SB.IVOC (0x88, 0x00)
            Store (\_SB.PCI0.OEMR, Local0)
            Release (\_SB.OEML)
            If (And (Local0, 0x01))
            {
                Notify (\_SB.SLPB, 0x80) // Status Change
            }

            If (And (Local0, 0x02))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If (LNotEqual (Local0, 0x00))
            {
                \_SB.IVOC (0x88, And (Local0, 0xFF))
            }
        }
    }

    Name (_S0, Package (0x02)  // _S0_: S0 System State
    {
        0x05, 
        0x05
    })
    Name (_S1, Package (0x02)  // _S1_: S1 System State
    {
        0x04, 
        0x04
    })
    Name (_S4, Package (0x02)  // _S4_: S4 System State
    {
        0x00, 
        0x00
    })
    Name (_S5, Package (0x02)  // _S5_: S5 System State
    {
        0x00, 
        0x00
    })
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (LGreaterEqual (Arg0, 0x02))
        {
            Store (One, \_SB.PCI0.CRST)
        }
        Else
        {
            Store (Zero, \_SB.PCI0.CRST)
        }
    }

    Scope (\_SB)
    {
        Method (MBAS, 1, NotSerialized)
        {
            Add (Multiply (Arg0, 0x10), 0x1000, Local0)
            Return (Add (Local0, ECFG))
        }

        Method (MCRS, 1, Serialized)
        {
            OperationRegion (MREG, SystemMemory, MBAS (Arg0), 0x10)
            Field (MREG, AnyAcc, NoLock, Preserve)
            {
                XSTA,   4, 
                    ,   1, 
                XPRS,   1, 
                XRMV,   1, 
                XIMP,   1, 
                Offset (0x02), 
                XBAS,   32, 
                Offset (0x08), 
                Offset (0x0A), 
                XEND,   32, 
                Offset (0x10)
            }

            Name (RSRC, Buffer (0x2E)
            {
                /* 0000 */  0x8A, 0x2B, 0x00, 0x00, 0x0C, 0x03, 0x00, 0x00,  /* .+...... */
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF,  /* ........ */
                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00               /* ...... */
            })
            Name (ENDT, ResourceTemplate ()
            {
            })
            Store (Zero, Local3)
            CreateDWordField (RSRC, 0x10, RMIN)
            CreateDWordField (RSRC, 0x18, RMAX)
            CreateDWordField (RSRC, 0x28, RLEN)
            Store (XBAS, Local0)
            Store (XEND, Local1)
            While (LNotEqual (Local0, Local1))
            {
                Store (Subtract (Local1, Local0), Local2)
                If (LGreater (Local2, 0xC000))
                {
                    Store (0xC000, Local2)
                }

                Store (Local0, RMIN) /* \_SB_.MCRS.RMIN */
                Store (Local2, RLEN) /* \_SB_.MCRS.RLEN */
                Subtract (Add (Local0, Local2), 0x01, RMAX) /* \_SB_.MCRS.RMAX */
                Add (Local0, Local2, Local0)
                If (LEqual (ObjectType (Local3), 0x03))
                {
                    Store (Concatenate (Local3, RSRC), Local3)
                }
                Else
                {
                    Store (RSRC, Local3)
                }
            }

            If (LEqual (ObjectType (Local3), 0x03))
            {
                Store (Concatenate (Local3, ENDT), Local3)
            }
            Else
            {
                Store (ENDT, Local3)
            }

            Return (Local3)
        }

        Method (MSTA, 1, Serialized)
        {
            OperationRegion (MREG, SystemMemory, MBAS (Arg0), 0x10)
            Field (MREG, AnyAcc, NoLock, Preserve)
            {
                XSTA,   4, 
                    ,   1, 
                XPRS,   1, 
                XRMV,   1, 
                XIMP,   1
            }

            Return (XSTA) /* \_SB_.MSTA.XSTA */
        }

        Method (MPXM, 1, Serialized)
        {
            OperationRegion (MREG, SystemMemory, MBAS (Arg0), 0x10)
            Field (MREG, AnyAcc, NoLock, Preserve)
            {
                XSTA,   4, 
                    ,   1, 
                XPRS,   1, 
                XRMV,   1, 
                XIMP,   1, 
                XPXM,   8
            }

            Return (XPXM) /* \_SB_.MPXM.XPXM */
        }

        Method (MEJ0, 2, Serialized)
        {
            OperationRegion (MREG, SystemMemory, MBAS (Arg0), 0x10)
            Field (MREG, AnyAcc, NoLock, Preserve)
            {
                XSTA,   4, 
                    ,   1, 
                XPRS,   1, 
                XRMV,   1, 
                XIMP,   1
            }

            Store (0x00, XPRS) /* \_SB_.MEJ0.XPRS */
        }

        Method (MOST, 4, Serialized)
        {
            OperationRegion (MREG, SystemMemory, MBAS (Arg0), 0x10)
            Field (MREG, AnyAcc, NoLock, Preserve)
            {
                XSTA,   4, 
                    ,   1, 
                XPRS,   1, 
                XRMV,   1, 
                XIMP,   1
            }
        }

        Method (L1MX, 2, NotSerialized)
        {
            Divide (Arg0, 0x40, Local0, Local1)
            If (LEqual (Local1, 0x00))
            {
                Return (^L1M0.L0MX) /* External reference */
                Local0
                Arg1
            }

            If (LEqual (Local1, 0x01))
            {
                Return (^L1M1.L0MX) /* External reference */
                Local0
                Arg1
            }

            If (LEqual (Local1, 0x02))
            {
                Return (^L1M2.L0MX) /* External reference */
                Local0
                Arg1
            }

            If (LEqual (Local1, 0x03))
            {
                Return (^L1M3.L0MX) /* External reference */
                Local0
                Arg1
            }

            If (LEqual (Local1, 0x04))
            {
                Return (^L1M4.L0MX) /* External reference */
                Local0
                Arg1
            }

            If (LEqual (Local1, 0x05))
            {
                Return (^L1M5.L0MX) /* External reference */
                Local0
                Arg1
            }

            If (LEqual (Local1, 0x06))
            {
                Return (^L1M6.L0MX) /* External reference */
                Local0
                Arg1
            }

            If (LEqual (Local1, 0x07))
            {
                Return (^L1M7.L0MX) /* External reference */
                Local0
                Arg1
            }

            Return (0xFFFFFFFE)
        }
    }

    Scope (\_SB.PCI0.ISA)
    {
        OperationRegion (LPCS, SystemMemory, ECFG, 0x0500)
        Device (HPET)
        {
            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0C01") /* System Board */)  // _CID: Compatible ID
            OperationRegion (EICH, SystemMemory, Add (ECFG, 0x4000), 0x4000)
            Field (EICH, DWordAcc, Lock, Preserve)
            {
                Offset (0x3404), 
                AS,     2, 
                    ,   5, 
                AE,     1
            }

            Field (LPCS, DWordAcc, Lock, Preserve)
            {
                Offset (0x328), 
                HBAS,   32
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (Or (AE, HBAS))
                {
                    Return (0x0F)
                }

                Return (0x00)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (TMPL, ResourceTemplate ()
                {
                    Memory32Fixed (ReadOnly,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        _Y14)
                })
                CreateDWordField (TMPL, \_SB.PCI0.ISA.HPET._CRS._Y14._BAS, BASE)  // _BAS: Base Address
                If (HBAS)
                {
                    Store (HBAS, BASE) /* \_SB_.PCI0.ISA_.HPET._CRS.BASE */
                }

                Return (TMPL) /* \_SB_.PCI0.ISA_.HPET._CRS.TMPL */
            }
        }

        Device (SMC)
        {
            Name (_HID, EisaId ("APP0001"))  // _HID: Hardware ID
            Name (_CID, "smc-santarosa")  // _CID: Compatible ID
            Field (LPCS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x200), 
                SMPR,   8, 
                SMEN,   8, 
                SMIR,   8, 
                Offset (0x208), 
                SMIO,   16, 
                Offset (0x20C), 
                SMVR,   8, 
                Offset (0x210), 
                SMMM,   32
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (SMVR)
                {
                    Store ("smc-huronriver", _CID) /* \_SB_.PCI0.ISA_.SMC_._CID */
                }
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If (SMEN)
                {
                    Return (0x0B)
                }

                Return (0x00)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Store (ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IRQNoFlags ()
                            {}
                    }, Local0)
                CreateWordField (Local0, 0x02, IOMN)
                CreateWordField (Local0, 0x04, IOMX)
                CreateWordField (Local0, 0x09, IRQS)
                Store (SMIO, IOMN) /* \_SB_.PCI0.ISA_.SMC_._CRS.IOMN */
                Store (SMIO, IOMX) /* \_SB_.PCI0.ISA_.SMC_._CRS.IOMX */
                Store (ShiftLeft (One, SMIR), IRQS) /* \_SB_.PCI0.ISA_.SMC_._CRS.IRQS */
                If (SMVR)
                {
                    Store (Buffer (0x0C)
                        {
                            /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  /* ........ */
                            /* 0008 */  0x00, 0x00, 0x01, 0x00                           /* .... */
                        }, Local1)
                    CreateDWordField (Local1, 0x04, MMBS)
                    Store (SMMM, MMBS) /* \_SB_.PCI0.ISA_.SMC_._CRS.MMBS */
                    Return (Concatenate (Local1, Local0))
                }

                Return (Local0)
            }
        }

        Name (RSR2, ResourceTemplate ()
        {
            IO (Decode16,
                0x0000,             // Range Minimum
                0x0000,             // Range Maximum
                0x04,               // Alignment
                0x04,               // Length
                )
            IRQNoFlags ()
                {}
        })
        Device (COM3)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DDN, "COM3")  // _DDN: DOS Device Name
            Field (LPCS, ByteAcc, NoLock, Preserve)
            {
                Offset (0x2A0), 
                PRES,   8, 
                ENAB,   8, 
                IRQL,   8, 
                Offset (0x2A8), 
                AccessAs (WordAcc, 0x00), 
                IOBA,   16, 
                AccessAs (ByteAcc, 0x00), 
                Offset (0x480), 
                    ,   7, 
                VALD,   1
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VALD))
                {
                    If (PRES)
                    {
                        If (ENAB)
                        {
                            Return (0x0F)
                        }

                        Return (0x0D)
                    }
                }

                Return (0x00)
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x09, IRQW)
                If (IRQW)
                {
                    FindSetRightBit (IRQW, Local0)
                    Subtract (Local0, 0x01, IRQL) /* \_SB_.PCI0.ISA_.COM3.IRQL */
                }
                Else
                {
                    Store (0xFF, IRQL) /* \_SB_.PCI0.ISA_.COM3.IRQL */
                }

                CreateWordField (Arg0, 0x02, IOAL)
                Store (IOAL, IOBA) /* \_SB_.PCI0.ISA_.COM3.IOBA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ENAB) /* \_SB_.PCI0.ISA_.COM3.ENAB */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (IOBA, IRQL, One))
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                StartDependentFnNoPri ()
                {
                    IO (Decode16,
                        0x03E8,             // Range Minimum
                        0x03E8,             // Range Maximum
                        0x08,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3,4,5,6,7,9,10,11,12,14,15}
                }
                StartDependentFnNoPri ()
                {
                    IO (Decode16,
                        0x02E8,             // Range Minimum
                        0x02E8,             // Range Maximum
                        0x08,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3,4,5,6,7,9,10,11,12,14,15}
                }
                StartDependentFn (0x02, 0x01)
                {
                    IO (Decode16,
                        0x0100,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x08,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3,4,5,6,7,9,10,11,12,14,15}
                }
                EndDependentFn ()
            })
        }

        Device (COM4)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_DDN, "COM4")  // _DDN: DOS Device Name
            Field (LPCS, ByteAcc, NoLock, Preserve)
            {
                Offset (0x2C0), 
                PRES,   8, 
                ENAB,   8, 
                IRQL,   8, 
                Offset (0x2C8), 
                AccessAs (WordAcc, 0x00), 
                IOBA,   16, 
                AccessAs (ByteAcc, 0x00), 
                Offset (0x480), 
                    ,   7, 
                VALD,   1
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VALD))
                {
                    If (PRES)
                    {
                        If (ENAB)
                        {
                            Return (0x0F)
                        }

                        Return (0x0D)
                    }
                }

                Return (0x00)
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x09, IRQW)
                If (IRQW)
                {
                    FindSetRightBit (IRQW, Local0)
                    Subtract (Local0, 0x01, IRQL) /* \_SB_.PCI0.ISA_.COM4.IRQL */
                }
                Else
                {
                    Store (0xFF, IRQL) /* \_SB_.PCI0.ISA_.COM4.IRQL */
                }

                CreateWordField (Arg0, 0x02, IOAL)
                Store (IOAL, IOBA) /* \_SB_.PCI0.ISA_.COM4.IOBA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ENAB) /* \_SB_.PCI0.ISA_.COM4.ENAB */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (IOBA, IRQL, One))
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                StartDependentFnNoPri ()
                {
                    IO (Decode16,
                        0x02E8,             // Range Minimum
                        0x02E8,             // Range Maximum
                        0x08,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3,4,5,6,7,9,10,11,12,14,15}
                }
                StartDependentFnNoPri ()
                {
                    IO (Decode16,
                        0x03E8,             // Range Minimum
                        0x03E8,             // Range Maximum
                        0x08,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3,4,5,6,7,9,10,11,12,14,15}
                }
                StartDependentFn (0x02, 0x01)
                {
                    IO (Decode16,
                        0x0100,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x08,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3,4,5,6,7,9,10,11,12,14,15}
                }
                EndDependentFn ()
            })
        }

        Device (LP02)
        {
            Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_DDN, "LPT2")  // _DDN: DOS Device Name
            Field (LPCS, ByteAcc, NoLock, Preserve)
            {
                Offset (0x2E0), 
                PRES,   8, 
                ENAB,   8, 
                IRQL,   8, 
                Offset (0x2E8), 
                AccessAs (WordAcc, 0x00), 
                IOBA,   16, 
                Offset (0x2EC), 
                AccessAs (DWordAcc, 0x00), 
                XTRA,   32
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PRES)
                {
                    If (ENAB)
                    {
                        Return (0x0F)
                    }

                    Return (0x0D)
                }

                Return (0x00)
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x09, IRQW)
                If (IRQW)
                {
                    FindSetRightBit (IRQW, Local0)
                    Subtract (Local0, 0x01, IRQL) /* \_SB_.PCI0.ISA_.LP02.IRQL */
                }
                Else
                {
                    Store (0xFF, IRQL) /* \_SB_.PCI0.ISA_.LP02.IRQL */
                }

                CreateWordField (Arg0, 0x02, IOAL)
                Store (IOAL, IOBA) /* \_SB_.PCI0.ISA_.LP02.IOBA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ENAB) /* \_SB_.PCI0.ISA_.LP02.ENAB */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (IOBA, IRQL, LEqual (XTRA, 0x03)))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (LEqual (XTRA, 0x03), 0x0278, 0x07, 0xDEF8))
            }
        }

        Device (LPT3)
        {
            Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DDN, "LPT3")  // _DDN: DOS Device Name
            Field (LPCS, ByteAcc, NoLock, Preserve)
            {
                Offset (0x300), 
                PRES,   8, 
                ENAB,   8, 
                IRQL,   8, 
                Offset (0x308), 
                AccessAs (WordAcc, 0x00), 
                IOBA,   16, 
                Offset (0x30C), 
                AccessAs (DWordAcc, 0x00), 
                XTRA,   32
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PRES)
                {
                    If (ENAB)
                    {
                        Return (0x0F)
                    }

                    Return (0x0D)
                }

                Return (0x00)
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x09, IRQW)
                If (IRQW)
                {
                    FindSetRightBit (IRQW, Local0)
                    Subtract (Local0, 0x01, IRQL) /* \_SB_.PCI0.ISA_.LPT3.IRQL */
                }
                Else
                {
                    Store (0xFF, IRQL) /* \_SB_.PCI0.ISA_.LPT3.IRQL */
                }

                CreateWordField (Arg0, 0x02, IOAL)
                Store (IOAL, IOBA) /* \_SB_.PCI0.ISA_.LPT3.IOBA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ENAB) /* \_SB_.PCI0.ISA_.LPT3.ENAB */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (IOBA, IRQL, LEqual (XTRA, 0x03)))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Store (LEqual (XTRA, 0x03), Local0)
                Store (0x03BC, Local1)
                If (Local0)
                {
                    Store (0x0378, Local1)
                }

                Return (LPRS (Local0, Local1, Zero, 0xDEF8))
            }
        }

        Name (SRSR, ResourceTemplate ()
        {
            IO (Decode16,
                0x0000,             // Range Minimum
                0x0000,             // Range Maximum
                0x08,               // Alignment
                0x08,               // Length
                )
            IRQ (Level, ActiveLow, Shared, )
                {0}
        })
        Method (SPRS, 0, Serialized)
        {
            Store (ResourceTemplate ()
                {
                    StartDependentFn (0x01, 0x00)
                    {
                        IO (Decode16,
                            0x0100,             // Range Minimum
                            0xFEF8,             // Range Maximum
                            0x08,               // Alignment
                            0x08,               // Length
                            )
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,6,7,9,10,11,12,14,15}
                    }
                    EndDependentFn ()
                }, Local0)
            Return (Local0)
        }

        Method (SCOM, 3, Serialized)
        {
            OperationRegion (SPRT, SystemMemory, Add (ECFG, Arg1), 0x04)
            Field (SPRT, ByteAcc, NoLock, Preserve)
            {
                STAV,   4, 
                    ,   3, 
                VALD,   1, 
                IRQL,   8, 
                AccessAs (WordAcc, 0x00), 
                IOBA,   16
            }

            If (LNot (Arg0))
            {
                Return (STAV) /* \_SB_.PCI0.ISA_.SCOM.STAV */
            }

            If (LEqual (Arg0, One))
            {
                Store (0x0D, STAV) /* \_SB_.PCI0.ISA_.SCOM.STAV */
                Return (Zero)
            }

            If (LEqual (Arg0, 0x02))
            {
                Store (SRSR, Local0)
            }
            Else
            {
                Store (Arg2, Local0)
            }

            CreateWordField (Local0, 0x02, IOAL)
            CreateWordField (Local0, 0x04, IOAH)
            CreateWordField (Local0, 0x09, IRQW)
            If (LEqual (Arg0, 0x02))
            {
                Store (IOBA, Local1)
                Store (Local1, IOAL) /* \_SB_.PCI0.ISA_.SCOM.IOAL */
                Store (Local1, IOAH) /* \_SB_.PCI0.ISA_.SCOM.IOAH */
                Store (IRQL, Local1)
                If (LEqual (Local1, 0xFF))
                {
                    Store (Zero, IRQW) /* \_SB_.PCI0.ISA_.SCOM.IRQW */
                }
                Else
                {
                    ShiftLeft (One, Local1, IRQW) /* \_SB_.PCI0.ISA_.SCOM.IRQW */
                }

                Return (Local0)
            }

            If (IRQW)
            {
                FindSetRightBit (IRQW, Local1)
                Subtract (Local1, One, IRQL) /* \_SB_.PCI0.ISA_.SCOM.IRQL */
            }
            Else
            {
                Store (0xFF, IRQL) /* \_SB_.PCI0.ISA_.SCOM.IRQL */
            }

            Store (IOAL, IOBA) /* \_SB_.PCI0.ISA_.SCOM.IOBA */
            Return (Zero)
        }

        Method (SSTA, 1, NotSerialized)
        {
            Return (SCOM (Zero, Arg0, Zero))
        }

        Method (SDIS, 1, NotSerialized)
        {
            SCOM (One, Arg0, Zero)
        }

        Method (SCRS, 1, NotSerialized)
        {
            Return (SCOM (0x02, Arg0, Zero))
        }

        Method (SSRS, 2, NotSerialized)
        {
            SCOM (0x03, Arg0, Arg1)
        }

        Device (CO02)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DDN, "COM3")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x0488))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x0488)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x0488, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x0488))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO03)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_DDN, "COM4")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x048C))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x048C)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x048C, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x048C))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO04)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_DDN, "COM5")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x0490))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x0490)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x0490, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x0490))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO05)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Name (_DDN, "COM6")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x0494))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x0494)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x0494, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x0494))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO06)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Name (_DDN, "COM7")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x0498))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x0498)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x0498, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x0498))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO07)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Name (_DDN, "COM8")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x049C))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x049C)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x049C, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x049C))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO08)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x09)  // _UID: Unique ID
            Name (_DDN, "COM9")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04A0))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04A0)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04A0, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04A0))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO09)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x0A)  // _UID: Unique ID
            Name (_DDN, "COM10")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04A4))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04A4)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04A4, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04A4))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO0A)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x0B)  // _UID: Unique ID
            Name (_DDN, "COM11")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04A8))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04A8)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04A8, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04A8))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO0B)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x0C)  // _UID: Unique ID
            Name (_DDN, "COM12")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04AC))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04AC)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04AC, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04AC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO0C)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x0D)  // _UID: Unique ID
            Name (_DDN, "COM13")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04B0))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04B0)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04B0, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04B0))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO0D)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x0E)  // _UID: Unique ID
            Name (_DDN, "COM14")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04B4))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04B4)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04B4, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04B4))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO0E)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x0F)  // _UID: Unique ID
            Name (_DDN, "COM15")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04B8))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04B8)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04B8, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04B8))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO0F)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x10)  // _UID: Unique ID
            Name (_DDN, "COM16")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04BC))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04BC)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04BC, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04BC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO10)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x11)  // _UID: Unique ID
            Name (_DDN, "COM17")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04C0))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04C0)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04C0, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04C0))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO11)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x12)  // _UID: Unique ID
            Name (_DDN, "COM18")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04C4))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04C4)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04C4, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04C4))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO12)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x13)  // _UID: Unique ID
            Name (_DDN, "COM19")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04C8))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04C8)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04C8, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04C8))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO13)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x14)  // _UID: Unique ID
            Name (_DDN, "COM20")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04CC))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04CC)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04CC, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04CC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO14)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x15)  // _UID: Unique ID
            Name (_DDN, "COM21")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04D0))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04D0)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04D0, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04D0))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO15)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x16)  // _UID: Unique ID
            Name (_DDN, "COM22")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04D4))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04D4)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04D4, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04D4))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO16)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x17)  // _UID: Unique ID
            Name (_DDN, "COM23")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04D8))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04D8)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04D8, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04D8))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO17)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x18)  // _UID: Unique ID
            Name (_DDN, "COM24")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04DC))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04DC)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04DC, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04DC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO18)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x19)  // _UID: Unique ID
            Name (_DDN, "COM25")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04E0))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04E0)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04E0, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04E0))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO19)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x1A)  // _UID: Unique ID
            Name (_DDN, "COM26")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04E4))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04E4)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04E4, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04E4))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO1A)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x1B)  // _UID: Unique ID
            Name (_DDN, "COM27")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04E8))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04E8)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04E8, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04E8))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO1B)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x1C)  // _UID: Unique ID
            Name (_DDN, "COM28")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04EC))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04EC)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04EC, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04EC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO1C)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x1D)  // _UID: Unique ID
            Name (_DDN, "COM29")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04F0))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04F0)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04F0, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04F0))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO1D)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x1E)  // _UID: Unique ID
            Name (_DDN, "COM30")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04F4))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04F4)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04F4, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04F4))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO1E)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x1F)  // _UID: Unique ID
            Name (_DDN, "COM31")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04F8))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04F8)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04F8, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04F8))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }

        Device (CO1F)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x20)  // _UID: Unique ID
            Name (_DDN, "COM32")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (SSTA (0x04FC))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                SDIS (0x04FC)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                SSRS (0x04FC, Arg0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (SCRS (0x04FC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (SPRS ())
            }
        }
    }

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            Scope (ISA)
            {
                Method (XRES, 6, Serialized)
                {
                    Store (Buffer (0x0D)
                        {
                            /* 0000 */  0x31, 0x00, 0x47, 0x01, 0x00, 0x00, 0x00, 0x00,  /* 1.G..... */
                            /* 0008 */  0x00, 0x00, 0x22, 0x00, 0x00                     /* ..".. */
                        }, Local0)
                    Store (Arg0, Index (Local0, 0x01))
                    CreateWordField (Local0, 0x04, IOAL)
                    Store (Arg1, IOAL) /* \_SB_.PCI0.ISA_.XRES.IOAL */
                    CreateWordField (Local0, 0x06, IOAH)
                    Store (Arg2, IOAH) /* \_SB_.PCI0.ISA_.XRES.IOAH */
                    Store (Arg3, Index (Local0, 0x08))
                    Store (Arg3, Index (Local0, 0x09))
                    CreateWordField (Local0, 0x0B, IRQF)
                    Store (Arg4, IRQF) /* \_SB_.PCI0.ISA_.XRES.IRQF */
                    Return (Concatenate (Local0, Arg5))
                }

                Method (XPRS, 4, Serialized)
                {
                    Store (XRES (Arg0, 0x0100, 0x03F8, Arg1, Arg2, Arg3), Local1)
                    Store (Subtract (Arg0, 0x01), Local0)
                    If (LEqual (Arg1, 0x04))
                    {
                        Store (XRES (Local0, 0x03BC, 0x03BC, Arg1, Arg2, Local1), Local1)
                    }

                    Store (XRES (Local0, 0x0278, 0x0278, Arg1, Arg2, Local1), Local1)
                    Store (XRES (Local0, 0x0378, 0x0378, Arg1, Arg2, Local1), Local1)
                    Return (Local1)
                }

                Method (LPRS, 4, Serialized)
                {
                    If (Arg0)
                    {
                        Store (0x08, Local2)
                    }
                    Else
                    {
                        Store (0x04, Local2)
                    }

                    Store (ResourceTemplate ()
                        {
                        }
                        EndDependentFn ()
                        }, Local1)
                    Store (XPRS (0x0A, Local2, Zero, Local1), Local1)
                    Store (XPRS (0x06, Local2, Arg3, Local1), Local1)
                    Store (Zero, Local3)
                    If (Arg2)
                    {
                        ShiftLeft (One, Arg2, Local3)
                    }

                    Store (XRES (0x01, Arg1, Arg1, Local2, Local3, Local1), Local1)
                    Return (Local1)
                }

                Name (RSRC, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x04,               // Alignment
                        0x04,               // Length
                        )
                    IRQNoFlags ()
                        {}
                })
                Method (LCRS, 3, NotSerialized)
                {
                    Store (RSRC, Local1)
                    CreateWordField (Local1, 0x02, IOAL)
                    CreateWordField (Local1, 0x04, IOAH)
                    Store (Arg0, IOAL) /* \_SB_.PCI0.ISA_.LCRS.IOAL */
                    Store (Arg0, IOAH) /* \_SB_.PCI0.ISA_.LCRS.IOAH */
                    If (LAnd (Arg1, LNotEqual (Arg1, 0xFF)))
                    {
                        CreateWordField (Local1, 0x09, IRQW)
                        ShiftLeft (One, Arg1, IRQW) /* \_SB_.PCI0.ISA_.LCRS.IRQW */
                    }

                    If (Arg2)
                    {
                        CreateByteField (Local1, 0x06, IOAN)
                        CreateByteField (Local1, 0x07, IOLN)
                        Store (0x08, IOAN) /* \_SB_.PCI0.ISA_.LCRS.IOAN */
                        Store (0x08, IOLN) /* \_SB_.PCI0.ISA_.LCRS.IOLN */
                    }

                    Return (Local1)
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05") /* Generic Container Device */)  // _HID: Hardware ID
                    OperationRegion (SIOR, SystemIO, 0x2E, 0x02)
                    Field (SIOR, ByteAcc, NoLock, Preserve)
                    {
                        SIOI,   8, 
                        SIOD,   8
                    }

                    IndexField (SIOI, SIOD, ByteAcc, NoLock, Preserve)
                    {
                        FLPT,   1, 
                        FCMA,   1, 
                        FCMB,   1, 
                        FDCA,   1, 
                        Offset (0x01), 
                        Offset (0x04), 
                        PEPP,   1, 
                        Offset (0x05), 
                        Offset (0x1B), 
                            ,   4, 
                        PPIR,   4, 
                        CAIR,   4, 
                        CBIR,   4, 
                        Offset (0x41), 
                        FCIR,   4, 
                        CDMA,   3, 
                        Offset (0x42), 
                        PBAL,   8, 
                        PBAH,   8, 
                        S1BL,   8, 
                        S1BH,   8, 
                        S2BL,   8, 
                        S2BH,   8, 
                        FBAL,   8, 
                        FBAH,   8
                    }

                    Method (SCRS, 4, NotSerialized)
                    {
                        Return (LCRS (Or (ShiftLeft (And (Arg1, 0xFC), 0x08), 
                            ShiftLeft (And (Arg0, 0xFF), 0x02)), Arg2, Arg3))
                    }

                    Method (CPRS, 2, Serialized)
                    {
                        Store (ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x01)
                                {
                                    IO (Decode16,
                                        0x0000,             // Range Minimum
                                        0x0000,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3,4,5,6,7,9,10,11,12}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3,4,5,6,7,9,10,11,12}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3,4,5,6,7,9,10,11,12}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3,4,5,6,7,9,10,11,12}
                                }
                                StartDependentFn (0x02, 0x01)
                                {
                                    IO (Decode16,
                                        0x0100,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x08,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3,4,5,6,7,9,10,11,12}
                                }
                                EndDependentFn ()
                            }, Local1)
                        CreateWordField (Local1, 0x04, IOAL)
                        CreateWordField (Local1, 0x06, IOAH)
                        CreateWordField (Local1, 0x0B, IRQW)
                        Store (Arg0, IOAL) /* \_SB_.PCI0.ISA_.SIO_.CPRS.IOAL */
                        Store (Arg0, IOAH) /* \_SB_.PCI0.ISA_.SIO_.CPRS.IOAH */
                        ShiftLeft (One, Arg1, IRQW) /* \_SB_.PCI0.ISA_.SIO_.CPRS.IRQW */
                        Return (Local1)
                    }

                    Device (LPT)
                    {
                        Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
                        Name (_DDN, "LPT1")  // _DDN: DOS Device Name
                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            Return (SCRS (PBAL, PBAH, PPIR, PEPP))
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x02, IOAL)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (Zero, FLPT) /* \_SB_.PCI0.ISA_.SIO_.FLPT */
                            ShiftRight (And (IOAL, 0xFC00), 0x08, PBAH) /* \_SB_.PCI0.ISA_.SIO_.PBAH */
                            ShiftRight (And (IOAL, 0x03FC), 0x02, PBAL) /* \_SB_.PCI0.ISA_.SIO_.PBAL */
                            If (IRQW)
                            {
                                FindSetRightBit (IRQW, Local0)
                                Subtract (Local0, 0x01, PPIR) /* \_SB_.PCI0.ISA_.SIO_.PPIR */
                            }
                            Else
                            {
                                Store (0x00, PPIR) /* \_SB_.PCI0.ISA_.SIO_.PPIR */
                            }

                            Store (One, FLPT) /* \_SB_.PCI0.ISA_.SIO_.FLPT */
                        }

                        Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                        {
                            Return (LPRS (PEPP, 0x0378, 0x05, 0x1EF8))
                        }

                        Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                        {
                            Store (0x00, FLPT) /* \_SB_.PCI0.ISA_.SIO_.FLPT */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (And (SIOC, 0x01))
                            {
                                If (FLPT)
                                {
                                    Return (0x0F)
                                }

                                If (PBAL)
                                {
                                    Return (0x0D)
                                }

                                Store (Ones, PBAL) /* \_SB_.PCI0.ISA_.SIO_.PBAL */
                                If (PBAL)
                                {
                                    Return (0x0D)
                                }
                            }

                            Return (0x00)
                        }
                    }

                    Device (COMA)
                    {
                        Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
                        Name (_UID, 0x01)  // _UID: Unique ID
                        Name (_DDN, "COM1")  // _DDN: DOS Device Name
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Return (SCRS (S1BL, S1BH, CAIR, One))
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x02, IOAL)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (Zero, FCMA) /* \_SB_.PCI0.ISA_.SIO_.FCMA */
                            ShiftRight (And (IOAL, 0xFC00), 0x08, S1BH) /* \_SB_.PCI0.ISA_.SIO_.S1BH */
                            ShiftRight (And (IOAL, 0x03F8), 0x02, S1BL) /* \_SB_.PCI0.ISA_.SIO_.S1BL */
                            If (IRQW)
                            {
                                FindSetRightBit (IRQW, Local0)
                                Subtract (Local0, 0x01, CAIR) /* \_SB_.PCI0.ISA_.SIO_.CAIR */
                            }
                            Else
                            {
                                Store (0x00, CAIR) /* \_SB_.PCI0.ISA_.SIO_.CAIR */
                            }

                            Store (One, FCMA) /* \_SB_.PCI0.ISA_.SIO_.FCMA */
                        }

                        Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                        {
                            Return (CPRS (0x03F8, 0x04))
                        }

                        Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                        {
                            Store (0x00, FCMA) /* \_SB_.PCI0.ISA_.SIO_.FCMA */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (And (SIOC, 0x02))
                            {
                                If (FCMA)
                                {
                                    Return (0x0F)
                                }

                                If (S1BL)
                                {
                                    Return (0x0D)
                                }

                                Store (Ones, S1BL) /* \_SB_.PCI0.ISA_.SIO_.S1BL */
                                If (S1BL)
                                {
                                    Return (0x0D)
                                }
                            }

                            Return (0x00)
                        }
                    }

                    Device (COMB)
                    {
                        Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
                        Name (_UID, 0x02)  // _UID: Unique ID
                        Name (_DDN, "COM2")  // _DDN: DOS Device Name
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Return (SCRS (S2BL, S2BH, CBIR, One))
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x02, IOAL)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (Zero, FCMB) /* \_SB_.PCI0.ISA_.SIO_.FCMB */
                            ShiftRight (And (IOAL, 0xFC00), 0x08, S2BH) /* \_SB_.PCI0.ISA_.SIO_.S2BH */
                            ShiftRight (And (IOAL, 0x03F8), 0x02, S2BL) /* \_SB_.PCI0.ISA_.SIO_.S2BL */
                            If (IRQW)
                            {
                                FindSetRightBit (IRQW, Local0)
                                Subtract (Local0, 0x01, CBIR) /* \_SB_.PCI0.ISA_.SIO_.CBIR */
                            }
                            Else
                            {
                                Store (0x00, CBIR) /* \_SB_.PCI0.ISA_.SIO_.CBIR */
                            }

                            Store (One, FCMB) /* \_SB_.PCI0.ISA_.SIO_.FCMB */
                        }

                        Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                        {
                            Return (CPRS (0x02F8, 0x03))
                        }

                        Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                        {
                            Store (0x00, FCMB) /* \_SB_.PCI0.ISA_.SIO_.FCMB */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (And (SIOC, 0x04))
                            {
                                If (FCMB)
                                {
                                    Return (0x0F)
                                }

                                If (S2BL)
                                {
                                    Return (0x0D)
                                }

                                Store (Ones, S2BL) /* \_SB_.PCI0.ISA_.SIO_.S2BL */
                                If (S2BL)
                                {
                                    Return (0x0D)
                                }
                            }

                            Return (0x00)
                        }
                    }

                    Device (FDC)
                    {
                        Name (_HID, EisaId ("PNP0700"))  // _HID: Hardware ID
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Store (RSRC, Local1)
                            CreateWordField (Local1, 0x02, IOAL)
                            CreateWordField (Local1, 0x04, IOAH)
                            CreateWordField (Local1, 0x0A, IOBL)
                            CreateWordField (Local1, 0x0C, IOBH)
                            CreateWordField (Local1, 0x11, IRQW)
                            CreateByteField (Local1, 0x14, DMAB)
                            Or (ShiftLeft (And (FBAH, 0xFC), 0x08), ShiftLeft (And (
                                FBAL, 0xFE), 0x02), Local0)
                            Store (Local0, IOAL) /* \_SB_.PCI0.ISA_.SIO_.FDC_._CRS.IOAL */
                            Store (Local0, IOAH) /* \_SB_.PCI0.ISA_.SIO_.FDC_._CRS.IOAH */
                            Add (Local0, 0x07, Local0)
                            Store (Local0, IOBL) /* \_SB_.PCI0.ISA_.SIO_.FDC_._CRS.IOBL */
                            Store (Local0, IOBH) /* \_SB_.PCI0.ISA_.SIO_.FDC_._CRS.IOBH */
                            Store (FCIR, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, IRQW) /* \_SB_.PCI0.ISA_.SIO_.FDC_._CRS.IRQW */
                            }

                            Store (CDMA, Local0)
                            ShiftRight (ShiftLeft (One, Local0), One, DMAB) /* \_SB_.PCI0.ISA_.SIO_.FDC_._CRS.DMAB */
                            Return (Local1)
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x02, IOAL)
                            CreateWordField (Arg0, 0x11, IRQW)
                            CreateByteField (Arg0, 0x14, DMAB)
                            Store (Zero, FDCA) /* \_SB_.PCI0.ISA_.SIO_.FDCA */
                            ShiftRight (And (IOAL, 0xFC00), 0x08, FBAH) /* \_SB_.PCI0.ISA_.SIO_.FBAH */
                            ShiftRight (And (IOAL, 0x03F8), 0x02, FBAL) /* \_SB_.PCI0.ISA_.SIO_.FBAL */
                            If (IRQW)
                            {
                                FindSetRightBit (IRQW, Local0)
                                Subtract (Local0, 0x01, FCIR) /* \_SB_.PCI0.ISA_.SIO_.FCIR */
                            }
                            Else
                            {
                                Store (0x00, FCIR) /* \_SB_.PCI0.ISA_.SIO_.FCIR */
                            }

                            If (DMAB)
                            {
                                FindSetRightBit (DMAB, CDMA) /* \_SB_.PCI0.ISA_.SIO_.CDMA */
                            }
                            Else
                            {
                                Store (0x00, CDMA) /* \_SB_.PCI0.ISA_.SIO_.CDMA */
                            }

                            Store (One, FDCA) /* \_SB_.PCI0.ISA_.SIO_.FDCA */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03F0,             // Range Minimum
                                    0x03F0,             // Range Maximum
                                    0x01,               // Alignment
                                    0x06,               // Length
                                    )
                                IO (Decode16,
                                    0x03F7,             // Range Minimum
                                    0x03F7,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IRQNoFlags ()
                                    {6}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {2}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F0,             // Range Minimum
                                    0x03F0,             // Range Maximum
                                    0x01,               // Alignment
                                    0x06,               // Length
                                    )
                                IO (Decode16,
                                    0x03F7,             // Range Minimum
                                    0x03F7,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4,5,6,7,9,10,11,12}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0,1,2,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0370,             // Range Minimum
                                    0x0370,             // Range Maximum
                                    0x01,               // Alignment
                                    0x06,               // Length
                                    )
                                IO (Decode16,
                                    0x0377,             // Range Minimum
                                    0x0377,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4,5,6,7,9,10,11,12}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0,1,2,3}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                        {
                            Store (0x00, FDCA) /* \_SB_.PCI0.ISA_.SIO_.FDCA */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (And (SIOC, 0x08))
                            {
                                If (FDCA)
                                {
                                    Return (0x0F)
                                }

                                If (FBAL)
                                {
                                    Return (0x0D)
                                }

                                Store (Ones, FBAL) /* \_SB_.PCI0.ISA_.SIO_.FBAL */
                                If (FBAL)
                                {
                                    Return (0x0D)
                                }
                            }

                            Return (0x00)
                        }
                    }

                    Device (LDEV)
                    {
                        Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                        Name (_UID, 0x05)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (LDDV)
                            {
                                Return (0x0F)
                            }

                            Return (Zero)
                        }

                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Store (ResourceTemplate ()
                                {
                                }, Local0)
                            If (And (LDDV, 0x80))
                            {
                                Concatenate (Buffer (0x10)
                                    {
                                        /* 0000 */  0x47, 0x01, 0xF0, 0x03, 0xF0, 0x03, 0x01, 0x06,  /* G....... */
                                        /* 0008 */  0x47, 0x01, 0xF7, 0x03, 0xF7, 0x03, 0x01, 0x01   /* G....... */
                                    }, Local0, Local1)
                                Store (Local1, Local0)
                            }

                            If (And (LDDV, 0x01))
                            {
                                Concatenate (Buffer (0x08)
                                    {
                                         0x47, 0x01, 0xF8, 0x03, 0xF8, 0x03, 0x01, 0x08   /* G....... */
                                    }, Local0, Local1)
                                Store (Local1, Local0)
                            }

                            If (And (LDDV, 0x02))
                            {
                                Concatenate (Buffer (0x08)
                                    {
                                         0x47, 0x01, 0xF8, 0x02, 0xF8, 0x02, 0x01, 0x08   /* G....... */
                                    }, Local0, Local1)
                                Store (Local1, Local0)
                            }

                            If (And (LDDV, 0x04))
                            {
                                Concatenate (Buffer (0x08)
                                    {
                                         0x47, 0x01, 0xE8, 0x03, 0xE8, 0x03, 0x01, 0x08   /* G....... */
                                    }, Local0, Local1)
                                Store (Local1, Local0)
                            }

                            If (And (LDDV, 0x08))
                            {
                                Concatenate (Buffer (0x08)
                                    {
                                         0x47, 0x01, 0xE8, 0x02, 0xE8, 0x02, 0x01, 0x08   /* G....... */
                                    }, Local0, Local1)
                                Store (Local1, Local0)
                            }

                            If (And (LDDV, 0x10))
                            {
                                Concatenate (Buffer (0x08)
                                    {
                                         0x47, 0x01, 0x78, 0x03, 0x78, 0x03, 0x01, 0x08   /* G.x.x... */
                                    }, Local0, Local1)
                                Store (Local1, Local0)
                            }

                            If (And (LDDV, 0x20))
                            {
                                Concatenate (Buffer (0x08)
                                    {
                                         0x47, 0x01, 0x78, 0x02, 0x78, 0x02, 0x01, 0x08   /* G.x.x... */
                                    }, Local0, Local1)
                                Store (Local1, Local0)
                            }

                            If (And (LDDV, 0x40))
                            {
                                Concatenate (Buffer (0x08)
                                    {
                                         0x47, 0x01, 0xBC, 0x03, 0xBC, 0x03, 0x01, 0x04   /* G....... */
                                    }, Local0, Local1)
                                Store (Local1, Local0)
                            }

                            Return (Local0)
                        }
                    }
                }
            }
        }
    }

    Scope (\_SB)
    {
        OperationRegion (EREG, SystemMemory, ECFG, 0x4000)
        Field (EREG, DWordAcc, NoLock, Preserve)
        {
            Offset (0xA0), 
            DCFI,   32, 
            DSLI,   32, 
            Offset (0xB0), 
            HPST,   32, 
            HPCM,   32, 
            HPSL,   32, 
            Offset (0x100), 
            QSTA,   32, 
            QCMD,   32, 
            QQUA,   32, 
            QDAT,   32, 
            Offset (0x232), 
            ACKW,   32, 
            Offset (0x400), 
            VVTB,   32, 
            VVTS,   32, 
            GENL,   32, 
            GENH,   32, 
            DBDF,   32, 
            DNAM,   256, 
            Offset (0x3004), 
            LDST,   1, 
            Offset (0x3008)
        }

        Processor (CP00, 0x00, 0x00001010, 0x06)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (Zero))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (Zero))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (Zero))
            }
        }

        Method (CSTA, 1, Serialized)
        {
            If (LNot (Arg0))
            {
                Return (0x0F)
            }

            Add (Add (ShiftLeft (ShiftRight (Arg0, 0x05), 0x02), 0x40
                ), ECFG, Local1)
            And (Arg0, 0x1F, Local3)
            OperationRegion (CREG, SystemMemory, Local1, 0x10)
            Field (CREG, DWordAcc, NoLock, Preserve)
            {
                CPUP,   32
            }

            Store (CPUP, Local0)
            If (And (ShiftLeft (0x01, Local3), Local0))
            {
                Return (0x0F)
            }

            Return (0x00)
        }

        Method (APID, 1, Serialized)
        {
            Add (Add (Arg0, 0x3200), ECFG, Local1)
            OperationRegion (CREG, SystemMemory, Local1, 0x01)
            Field (CREG, ByteAcc, NoLock, Preserve)
            {
                LOC2,   8
            }

            Store (LOC2, Local0)
            If (Local0)
            {
                Return (Local0)
            }

            Return (Arg0)
        }

        Method (CMAT, 1, NotSerialized)
        {
            Store (Buffer (0x08)
                {
                     0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, Local0)
            Store (Arg0, Index (Local0, 0x02))
            Store (APID (Arg0), Index (Local0, 0x03))
            Store (And (CSTA (Arg0), 0x01), Index (Local0, 0x04))
            Return (Local0)
        }

        Method (CPXM, 1, Serialized)
        {
            Store (APID (Arg0), Local2)
            Add (Add (Local2, 0x3100), ECFG, Local1)
            OperationRegion (CREG, SystemMemory, Local1, 0x01)
            Field (CREG, ByteAcc, NoLock, Preserve)
            {
                PXMI,   8
            }

            Return (PXMI) /* \_SB_.CPXM.PXMI */
        }

        Method (CEJ0, 2, Serialized)
        {
            Add (Add (ShiftLeft (ShiftRight (Arg0, 0x05), 0x02), 0x60
                ), ECFG, Local1)
            And (Arg0, 0x1F, Local3)
            OperationRegion (CREG, SystemMemory, Local1, 0x10)
            Field (CREG, DWordAcc, NoLock, Preserve)
            {
                CPUA,   32
            }

            Store (ShiftLeft (0x01, Local3), CPUA) /* \_SB_.CEJ0.CPUA */
        }

        Scope (PCI0)
        {
            OperationRegion (RE01, PCI_Config, 0x40, 0x04)
            Field (RE01, DWordAcc, NoLock, Preserve)
            {
                ECIO,   32
            }

            OperationRegion (RE02, PCI_Config, 0xC4, 0x04)
            Field (RE02, DWordAcc, NoLock, Preserve)
            {
                VMME,   1, 
                VMMS,   3, 
                    ,   16, 
                VMMB,   12
            }

            Name (SUPP, 0x00)
            Name (CTRL, 0x00)
            Method (_OSC, 4, Serialized)  // _OSC: Operating System Capabilities
            {
                If (LEqual (Arg0, ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, 0x00, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    Store (CDW2, SUPP) /* \_SB_.PCI0.SUPP */
                    Store (CDW3, CTRL) /* \_SB_.PCI0.CTRL */
                    Name (HPIN, 0x3F)
                    And (CTRL, POSC, CTRL) /* \_SB_.PCI0.CTRL */
                    If (LNot (And (CDW1, 0x01)))
                    {
                        If (And (CTRL, 0x01))
                        {
                            And (Not (0x02), HPIN, HPIN) /* \_SB_.PCI0._OSC.HPIN */
                        }

                        If (And (CTRL, 0x02))
                        {
                            And (Not (0x01), HPIN, HPIN) /* \_SB_.PCI0._OSC.HPIN */
                        }

                        If (And (CTRL, 0x04)) {}
                        If (And (CTRL, 0x10)) {}
                    }

                    Store (DCFI, Local0)
                    Store (Or (And (Local0, Not (0x3F)), HPIN), 
                        DCFI) /* \_SB_.DCFI */
                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    Store (CTRL, CDW3) /* \_SB_.PCI0._OSC.CDW3 */
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    Return (Arg3)
                }
            }

            Device (EXPL)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (CCAP)
                    {
                        Return (0x0F)
                    }

                    Return (0x00)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    Name (BUF1, ResourceTemplate ()
                    {
                        DWordMemory (ResourceConsumer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                            0x00000000,         // Granularity
                            0x00000000,         // Range Minimum
                            0x00000000,         // Range Maximum
                            0x00000000,         // Translation Offset
                            0x00000000,         // Length
                            ,, _Y15, AddressRangeMemory, TypeStatic)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y16)
                        DWordMemory (ResourceConsumer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                            0x00000000,         // Granularity
                            0x00000000,         // Range Minimum
                            0x00000000,         // Range Maximum
                            0x00000000,         // Translation Offset
                            0x00000000,         // Length
                            ,, _Y17, AddressRangeMemory, TypeStatic)
                    })
                    If (VMME)
                    {
                        CreateDWordField (BUF1, \_SB.PCI0.EXPL._CRS._Y15._MIN, MCMN)  // _MIN: Minimum Base Address
                        CreateDWordField (BUF1, \_SB.PCI0.EXPL._CRS._Y15._MAX, MCMX)  // _MAX: Maximum Base Address
                        CreateDWordField (BUF1, \_SB.PCI0.EXPL._CRS._Y15._LEN, MCLN)  // _LEN: Length
                        Store (ShiftLeft (VMMB, 0x14), MCMN) /* \_SB_.PCI0.EXPL._CRS.MCMN */
                        Store (ShiftRight (0x10000000, VMMS), MCLN) /* \_SB_.PCI0.EXPL._CRS.MCLN */
                        Store (Subtract (Add (MCMN, MCLN), 0x01), MCMX) /* \_SB_.PCI0.EXPL._CRS.MCMX */
                    }

                    If (ECIO)
                    {
                        CreateWordField (BUF1, \_SB.PCI0.EXPL._CRS._Y16._MIN, IOMN)  // _MIN: Minimum Base Address
                        CreateWordField (BUF1, \_SB.PCI0.EXPL._CRS._Y16._MAX, IOMX)  // _MAX: Maximum Base Address
                        CreateByteField (BUF1, \_SB.PCI0.EXPL._CRS._Y16._LEN, IOLN)  // _LEN: Length
                        Store (And (ECIO, Not (0x01)), IOMN) /* \_SB_.PCI0.EXPL._CRS.IOMN */
                        Store (IOMN, IOMX) /* \_SB_.PCI0.EXPL._CRS.IOMX */
                        Store (0x20, IOLN) /* \_SB_.PCI0.EXPL._CRS.IOLN */
                    }

                    If (ECFG)
                    {
                        CreateDWordField (BUF1, \_SB.PCI0.EXPL._CRS._Y17._MIN, MIMN)  // _MIN: Minimum Base Address
                        CreateDWordField (BUF1, \_SB.PCI0.EXPL._CRS._Y17._MAX, MIMX)  // _MAX: Maximum Base Address
                        CreateDWordField (BUF1, \_SB.PCI0.EXPL._CRS._Y17._LEN, MILN)  // _LEN: Length
                        Store (ECFG, MIMN) /* \_SB_.PCI0.EXPL._CRS.MIMN */
                        Store (0x00200000, MILN) /* \_SB_.PCI0.EXPL._CRS.MILN */
                        Store (Subtract (Add (MIMN, MILN), 0x01), MIMX) /* \_SB_.PCI0.EXPL._CRS.MIMX */
                    }

                    Return (BUF1) /* \_SB_.PCI0.EXPL._CRS.BUF1 */
                }
            }

            Device (DMAR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (VVTS)
                    {
                        Return (0x0F)
                    }

                    Return (0x00)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    Name (TMPL, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y18)
                    })
                    CreateDWordField (TMPL, \_SB.PCI0.DMAR._CRS._Y18._BAS, BASE)  // _BAS: Base Address
                    CreateDWordField (TMPL, \_SB.PCI0.DMAR._CRS._Y18._LEN, SIZE)  // _LEN: Length
                    If (VVTS)
                    {
                        Store (VVTB, BASE) /* \_SB_.PCI0.DMAR._CRS.BASE */
                        Store (VVTS, SIZE) /* \_SB_.PCI0.DMAR._CRS.SIZE */
                    }

                    Return (TMPL) /* \_SB_.PCI0.DMAR._CRS.TMPL */
                }
            }

            Device (VMGC)
            {
                Name (_HID, "VMW0001")  // _HID: Hardware ID
                Name (_CID, Package (0x02)  // _CID: Compatible ID
                {
                    "VM_Gen_Counter", 
                    EisaId ("PNP0C02") /* PNP Motherboard Resources */
                })
                Name (_UID, 0x07)  // _UID: Unique ID
                Name (_DDN, "VM_Gen_Counter")  // _DDN: DOS Device Name
                Method (_INI, 0, Serialized)  // _INI: Initialize
                {
                    If (LEqual (TOOS, 0x1000))
                    {
                        Store (0x020CD041, _CID) /* \_SB_.PCI0.VMGC._CID */
                    }
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Store (GENL, Local0)
                    If (And (Local0, 0x01))
                    {
                        Return (0x0B)
                    }

                    Return (0x00)
                }

                Method (ADDR, 0, Serialized)
                {
                    Store (Package (0x02) {}, Local0)
                    And (GENL, 0xFFFFFFF0, Index (Local0, Zero))
                    Store (GENH, Index (Local0, One))
                    Return (Local0)
                }
            }

            Method (DVHP, 0, Serialized)
            {
                Store (HPCM, Local0)
                Store (HPSL, Local5)
                And (0xFFFF, Local5, Local2)
                ShiftRight (Local5, 0x10, Local1)
                If (LLess (Local1, 0x10))
                {
                    Add (ShiftLeft (Local1, 0x03), 0x88, Local1)
                }

                And (Local1, 0x07, Local3)
                ShiftRight (Local1, 0x03, Local4)
                If (LEqual (Local0, 0x01))
                {
                    If (LEqual (0x88, Local1))
                    {
                        Notify (P2P0, Zero) // Bus Check
                    }
                    Else
                    {
                        If (LEqual (0x90, Local1))
                        {
                            Notify (P2P1, Zero) // Bus Check
                        }
                        Else
                        {
                            If (LEqual (0x98, Local1))
                            {
                                Notify (P2P2, Zero) // Bus Check
                            }
                            Else
                            {
                                If (LEqual (0xA0, Local1))
                                {
                                    Notify (P2P3, Zero) // Bus Check
                                }
                                Else
                                {
                                    If (LEqual (0xE8, Local1))
                                    {
                                        Notify (PEC0, Zero) // Bus Check
                                    }
                                    Else
                                    {
                                        If (LEqual (0xF0, Local1))
                                        {
                                            Notify (PED0, Zero) // Bus Check
                                        }
                                        Else
                                        {
                                            If (LEqual (0xF8, Local1))
                                            {
                                                Notify (PEE0, Zero) // Bus Check
                                            }
                                            Else
                                            {
                                                If (LEqual (Local4, 0x15))
                                                {
                                                    If (LNot (Local3))
                                                    {
                                                        Notify (PE40, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE41, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE42, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE43, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE44, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE45, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE46, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE47, Zero) // Bus Check
                                                    }
                                                }

                                                If (LEqual (Local4, 0x16))
                                                {
                                                    If (LNot (Local3))
                                                    {
                                                        Notify (PE50, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE51, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE52, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE53, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE54, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE55, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE56, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE57, Zero) // Bus Check
                                                    }
                                                }

                                                If (LEqual (Local4, 0x17))
                                                {
                                                    If (LNot (Local3))
                                                    {
                                                        Notify (PE60, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE61, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE62, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE63, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE64, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE65, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE66, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE67, Zero) // Bus Check
                                                    }
                                                }

                                                If (LEqual (Local4, 0x18))
                                                {
                                                    If (LNot (Local3))
                                                    {
                                                        Notify (PE70, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE71, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE72, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE73, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE74, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE75, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE76, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE77, Zero) // Bus Check
                                                    }
                                                }

                                                If (LEqual (Local4, 0x19))
                                                {
                                                    If (LNot (Local3))
                                                    {
                                                        Notify (PE80, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE81, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE82, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE83, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE84, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE85, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE86, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE87, Zero) // Bus Check
                                                    }
                                                }

                                                If (LEqual (Local4, 0x1A))
                                                {
                                                    If (LNot (Local3))
                                                    {
                                                        Notify (PE90, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE91, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE92, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE93, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE94, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE95, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE96, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PE97, Zero) // Bus Check
                                                    }
                                                }

                                                If (LEqual (Local4, 0x1B))
                                                {
                                                    If (LNot (Local3))
                                                    {
                                                        Notify (PEA0, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEA1, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEA2, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEA3, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEA4, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEA5, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEA6, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEA7, Zero) // Bus Check
                                                    }
                                                }

                                                If (LEqual (Local4, 0x1C))
                                                {
                                                    If (LNot (Local3))
                                                    {
                                                        Notify (PEB0, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEB1, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEB2, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEB3, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEB4, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEB5, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEB6, Zero) // Bus Check
                                                    }

                                                    If (LNot (Decrement (Local3)))
                                                    {
                                                        Notify (PEB7, Zero) // Bus Check
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Store (0xFFFFFFFE, HPST) /* \_SB_.HPST */
                }
                Else
                {
                    If (LEqual (Local0, 0x02))
                    {
                        Store (0x03, Local6)
                        If (LEqual (0x88, Local1))
                        {
                            ^P2P0.PPHR (Local2, Local6)
                        }
                        Else
                        {
                            If (LEqual (0x90, Local1))
                            {
                                ^P2P1.PPHR (Local2, Local6)
                            }
                            Else
                            {
                                If (LEqual (0x98, Local1))
                                {
                                    ^P2P2.PPHR (Local2, Local6)
                                }
                                Else
                                {
                                    If (LEqual (0xA0, Local1))
                                    {
                                        ^P2P3.PPHR (Local2, Local6)
                                    }
                                    Else
                                    {
                                        If (LEqual (0xE8, Local1))
                                        {
                                            ^PEC0.PPHR (Local2, Local6)
                                        }
                                        Else
                                        {
                                            If (LEqual (0xF0, Local1))
                                            {
                                                ^PED0.PPHR (Local2, Local6)
                                            }
                                            Else
                                            {
                                                If (LEqual (0xF8, Local1))
                                                {
                                                    ^PEE0.PPHR (Local2, Local6)
                                                }
                                                Else
                                                {
                                                    If (LEqual (Local4, 0x15))
                                                    {
                                                        If (LNot (Local3))
                                                        {
                                                            ^PE40.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE41.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE42.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE43.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE44.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE45.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE46.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE47.PPHR (Local2, Local6)
                                                        }
                                                    }

                                                    If (LEqual (Local4, 0x16))
                                                    {
                                                        If (LNot (Local3))
                                                        {
                                                            ^PE50.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE51.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE52.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE53.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE54.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE55.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE56.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE57.PPHR (Local2, Local6)
                                                        }
                                                    }

                                                    If (LEqual (Local4, 0x17))
                                                    {
                                                        If (LNot (Local3))
                                                        {
                                                            ^PE60.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE61.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE62.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE63.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE64.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE65.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE66.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE67.PPHR (Local2, Local6)
                                                        }
                                                    }

                                                    If (LEqual (Local4, 0x18))
                                                    {
                                                        If (LNot (Local3))
                                                        {
                                                            ^PE70.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE71.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE72.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE73.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE74.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE75.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE76.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE77.PPHR (Local2, Local6)
                                                        }
                                                    }

                                                    If (LEqual (Local4, 0x19))
                                                    {
                                                        If (LNot (Local3))
                                                        {
                                                            ^PE80.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE81.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE82.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE83.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE84.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE85.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE86.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE87.PPHR (Local2, Local6)
                                                        }
                                                    }

                                                    If (LEqual (Local4, 0x1A))
                                                    {
                                                        If (LNot (Local3))
                                                        {
                                                            ^PE90.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE91.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE92.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE93.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE94.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE95.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE96.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PE97.PPHR (Local2, Local6)
                                                        }
                                                    }

                                                    If (LEqual (Local4, 0x1B))
                                                    {
                                                        If (LNot (Local3))
                                                        {
                                                            ^PEA0.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEA1.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEA2.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEA3.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEA4.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEA5.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEA6.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEA7.PPHR (Local2, Local6)
                                                        }
                                                    }

                                                    If (LEqual (Local4, 0x1C))
                                                    {
                                                        If (LNot (Local3))
                                                        {
                                                            ^PEB0.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEB1.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEB2.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEB3.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEB4.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEB5.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEB6.PPHR (Local2, Local6)
                                                        }

                                                        If (LNot (Decrement (Local3)))
                                                        {
                                                            ^PEB7.PPHR (Local2, Local6)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Store (0xFFFFFFFE, HPST) /* \_SB_.HPST */
                    }
                    Else
                    {
                        Store (0xFFFFFFFF, HPST) /* \_SB_.HPST */
                    }
                }
            }

            Method (PBAD, 1, NotSerialized)
            {
                And (Arg0, 0x07, Local3)
                If (Local3)
                {
                    Or (ShiftLeft (Local3, 0x10), ShiftLeft (And (Arg0, 0xFFFF0000), 
                        0x03), Local3)
                }
                Else
                {
                    Subtract (Arg0, 0x00110000, Local3)
                }

                Return (Local3)
            }

            Method (PEJ0, 3, NotSerialized)
            {
                Store (Or (PBAD (Arg2), ShiftRight (Arg1, 0x10)), DSLI) /* \_SB_.DSLI */
            }

            Method (PSHP, 1, NotSerialized)
            {
                ShiftRight (Subtract (Arg0, 0x00110000), 0x10, Local2)
                ShiftLeft (0x04, Local2, Local1)
                Or (Local1, 0x01, Local1)
                Store (DCFI, Local0)
                Store (And (Local0, Not (Local1)), DCFI) /* \_SB_.DCFI */
            }

            Method (PSTA, 2, NotSerialized)
            {
                Return (And (Arg0, Not (LEqual (Arg1, 0xFFFFFFFF))))
            }

            Mutex (DVNL, 0x0F)
            Method (PDSM, 6, Serialized)
            {
                If (LEqual (Arg0, ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    If (LGreaterEqual (Arg1, 0x02))
                    {
                        If (LEqual (0x00, Arg2))
                        {
                            Acquire (DVNL, 0xFFFF)
                            Store (0x01, DBDF) /* \_SB_.DBDF */
                            Store (DBDF, Local1)
                            Release (DVNL)
                            If (LNotEqual (0x00, Local1))
                            {
                                Return (Buffer (0x01)
                                {
                                     0x81                                             /* . */
                                })
                            }

                            Return (Buffer (0x01)
                            {
                                 0x01                                             /* . */
                            })
                        }
                        Else
                        {
                            If (LEqual (0x07, Arg2))
                            {
                                Or (PBAD (Arg5), ShiftRight (Arg4, 0x08), Local1)
                                Acquire (DVNL, 0xFFFF)
                                Store (Local1, DBDF) /* \_SB_.DBDF */
                                Store (Package (0x02) {}, Local0)
                                Store (DBDF, Local1)
                                If (LEqual (0x00, Local1))
                                {
                                    Release (DVNL)
                                    Return (Buffer (0x01)
                                    {
                                         0x00                                             /* . */
                                    })
                                }

                                Store (DBDF, Index (Local0, Zero))
                                Store (DNAM, Local5)
                                Store (Zero, Local4)
                                While (LOr (DerefOf (Index (Local5, Local4)), DerefOf (Index (Local5, 
                                    Add (Local4, One)))))
                                {
                                    Add (Local4, 0x02, Local4)
                                }

                                Add (Local4, 0x02, Local4)
                                Store (Mid (DNAM, Zero, Local4), Index (Local0, One))
                                Release (DVNL)
                                Return (Local0)
                            }
                        }
                    }
                }

                Return (Buffer (0x01)
                {
                     0x00                                             /* . */
                })
            }

            Device (P2P0)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x079015AD), 0x0F))
                }

                Method (OSHP, 0, NotSerialized)
                {
                    PSHP (_ADR)
                }

                Method (PPHR, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LNot (Local0))
                    {
                        Notify (S1F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S2F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S3F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S4F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S5F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S6F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S7F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S8F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S9F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S10F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S11F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S12F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S13F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S14F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S15F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S16F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S17F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S18F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S19F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S20F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S21F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S22F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S23F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S24F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S25F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S26F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S27F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S28F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S29F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S30F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S31F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S32F, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x20)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S2F0)
                {
                    Name (_ADR, 0x00010000)  // _ADR: Address
                    Name (_SUN, 0x21)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S3F0)
                {
                    Name (_ADR, 0x00020000)  // _ADR: Address
                    Name (_SUN, 0x22)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S4F0)
                {
                    Name (_ADR, 0x00030000)  // _ADR: Address
                    Name (_SUN, 0x23)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S5F0)
                {
                    Name (_ADR, 0x00040000)  // _ADR: Address
                    Name (_SUN, 0x24)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S6F0)
                {
                    Name (_ADR, 0x00050000)  // _ADR: Address
                    Name (_SUN, 0x25)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S7F0)
                {
                    Name (_ADR, 0x00060000)  // _ADR: Address
                    Name (_SUN, 0x26)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S8F0)
                {
                    Name (_ADR, 0x00070000)  // _ADR: Address
                    Name (_SUN, 0x27)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S9F0)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
                    Name (_SUN, 0x28)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S10F)
                {
                    Name (_ADR, 0x00090000)  // _ADR: Address
                    Name (_SUN, 0x29)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S11F)
                {
                    Name (_ADR, 0x000A0000)  // _ADR: Address
                    Name (_SUN, 0x2A)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S12F)
                {
                    Name (_ADR, 0x000B0000)  // _ADR: Address
                    Name (_SUN, 0x2B)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S13F)
                {
                    Name (_ADR, 0x000C0000)  // _ADR: Address
                    Name (_SUN, 0x2C)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S14F)
                {
                    Name (_ADR, 0x000D0000)  // _ADR: Address
                    Name (_SUN, 0x2D)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S15F)
                {
                    Name (_ADR, 0x000E0000)  // _ADR: Address
                    Name (_SUN, 0x2E)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S16F)
                {
                    Name (_ADR, 0x000F0000)  // _ADR: Address
                    Name (_SUN, 0x2F)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S17F)
                {
                    Name (_ADR, 0x00100000)  // _ADR: Address
                    Name (_SUN, 0x30)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S18F)
                {
                    Name (_ADR, 0x00110000)  // _ADR: Address
                    Name (_SUN, 0x31)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S19F)
                {
                    Name (_ADR, 0x00120000)  // _ADR: Address
                    Name (_SUN, 0x32)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S20F)
                {
                    Name (_ADR, 0x00130000)  // _ADR: Address
                    Name (_SUN, 0x33)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S21F)
                {
                    Name (_ADR, 0x00140000)  // _ADR: Address
                    Name (_SUN, 0x34)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S22F)
                {
                    Name (_ADR, 0x00150000)  // _ADR: Address
                    Name (_SUN, 0x35)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S23F)
                {
                    Name (_ADR, 0x00160000)  // _ADR: Address
                    Name (_SUN, 0x36)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S24F)
                {
                    Name (_ADR, 0x00170000)  // _ADR: Address
                    Name (_SUN, 0x37)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S25F)
                {
                    Name (_ADR, 0x00180000)  // _ADR: Address
                    Name (_SUN, 0x38)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S26F)
                {
                    Name (_ADR, 0x00190000)  // _ADR: Address
                    Name (_SUN, 0x39)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S27F)
                {
                    Name (_ADR, 0x001A0000)  // _ADR: Address
                    Name (_SUN, 0x3A)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S28F)
                {
                    Name (_ADR, 0x001B0000)  // _ADR: Address
                    Name (_SUN, 0x3B)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S29F)
                {
                    Name (_ADR, 0x001C0000)  // _ADR: Address
                    Name (_SUN, 0x3C)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S30F)
                {
                    Name (_ADR, 0x001D0000)  // _ADR: Address
                    Name (_SUN, 0x3D)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S31F)
                {
                    Name (_ADR, 0x001E0000)  // _ADR: Address
                    Name (_SUN, 0x3E)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S32F)
                {
                    Name (_ADR, 0x001F0000)  // _ADR: Address
                    Name (_SUN, 0x3F)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (P2P1)
            {
                Name (_ADR, 0x00120000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x079015AD), 0x0F))
                }

                Method (OSHP, 0, NotSerialized)
                {
                    PSHP (_ADR)
                }

                Method (PPHR, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LNot (Local0))
                    {
                        Notify (S1F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S2F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S3F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S4F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S5F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S6F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S7F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S8F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S9F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S10F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S11F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S12F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S13F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S14F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S15F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S16F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S17F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S18F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S19F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S20F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S21F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S22F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S23F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S24F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S25F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S26F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S27F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S28F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S29F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S30F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S31F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S32F, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x40)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S2F0)
                {
                    Name (_ADR, 0x00010000)  // _ADR: Address
                    Name (_SUN, 0x41)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S3F0)
                {
                    Name (_ADR, 0x00020000)  // _ADR: Address
                    Name (_SUN, 0x42)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S4F0)
                {
                    Name (_ADR, 0x00030000)  // _ADR: Address
                    Name (_SUN, 0x43)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S5F0)
                {
                    Name (_ADR, 0x00040000)  // _ADR: Address
                    Name (_SUN, 0x44)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S6F0)
                {
                    Name (_ADR, 0x00050000)  // _ADR: Address
                    Name (_SUN, 0x45)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S7F0)
                {
                    Name (_ADR, 0x00060000)  // _ADR: Address
                    Name (_SUN, 0x46)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S8F0)
                {
                    Name (_ADR, 0x00070000)  // _ADR: Address
                    Name (_SUN, 0x47)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S9F0)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
                    Name (_SUN, 0x48)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S10F)
                {
                    Name (_ADR, 0x00090000)  // _ADR: Address
                    Name (_SUN, 0x49)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S11F)
                {
                    Name (_ADR, 0x000A0000)  // _ADR: Address
                    Name (_SUN, 0x4A)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S12F)
                {
                    Name (_ADR, 0x000B0000)  // _ADR: Address
                    Name (_SUN, 0x4B)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S13F)
                {
                    Name (_ADR, 0x000C0000)  // _ADR: Address
                    Name (_SUN, 0x4C)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S14F)
                {
                    Name (_ADR, 0x000D0000)  // _ADR: Address
                    Name (_SUN, 0x4D)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S15F)
                {
                    Name (_ADR, 0x000E0000)  // _ADR: Address
                    Name (_SUN, 0x4E)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S16F)
                {
                    Name (_ADR, 0x000F0000)  // _ADR: Address
                    Name (_SUN, 0x4F)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S17F)
                {
                    Name (_ADR, 0x00100000)  // _ADR: Address
                    Name (_SUN, 0x50)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S18F)
                {
                    Name (_ADR, 0x00110000)  // _ADR: Address
                    Name (_SUN, 0x51)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S19F)
                {
                    Name (_ADR, 0x00120000)  // _ADR: Address
                    Name (_SUN, 0x52)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S20F)
                {
                    Name (_ADR, 0x00130000)  // _ADR: Address
                    Name (_SUN, 0x53)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S21F)
                {
                    Name (_ADR, 0x00140000)  // _ADR: Address
                    Name (_SUN, 0x54)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S22F)
                {
                    Name (_ADR, 0x00150000)  // _ADR: Address
                    Name (_SUN, 0x55)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S23F)
                {
                    Name (_ADR, 0x00160000)  // _ADR: Address
                    Name (_SUN, 0x56)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S24F)
                {
                    Name (_ADR, 0x00170000)  // _ADR: Address
                    Name (_SUN, 0x57)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S25F)
                {
                    Name (_ADR, 0x00180000)  // _ADR: Address
                    Name (_SUN, 0x58)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S26F)
                {
                    Name (_ADR, 0x00190000)  // _ADR: Address
                    Name (_SUN, 0x59)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S27F)
                {
                    Name (_ADR, 0x001A0000)  // _ADR: Address
                    Name (_SUN, 0x5A)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S28F)
                {
                    Name (_ADR, 0x001B0000)  // _ADR: Address
                    Name (_SUN, 0x5B)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S29F)
                {
                    Name (_ADR, 0x001C0000)  // _ADR: Address
                    Name (_SUN, 0x5C)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S30F)
                {
                    Name (_ADR, 0x001D0000)  // _ADR: Address
                    Name (_SUN, 0x5D)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S31F)
                {
                    Name (_ADR, 0x001E0000)  // _ADR: Address
                    Name (_SUN, 0x5E)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S32F)
                {
                    Name (_ADR, 0x001F0000)  // _ADR: Address
                    Name (_SUN, 0x5F)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (P2P2)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x079015AD), 0x0F))
                }

                Method (OSHP, 0, NotSerialized)
                {
                    PSHP (_ADR)
                }

                Method (PPHR, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LNot (Local0))
                    {
                        Notify (S1F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S2F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S3F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S4F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S5F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S6F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S7F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S8F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S9F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S10F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S11F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S12F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S13F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S14F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S15F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S16F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S17F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S18F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S19F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S20F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S21F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S22F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S23F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S24F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S25F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S26F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S27F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S28F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S29F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S30F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S31F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S32F, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x60)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S2F0)
                {
                    Name (_ADR, 0x00010000)  // _ADR: Address
                    Name (_SUN, 0x61)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S3F0)
                {
                    Name (_ADR, 0x00020000)  // _ADR: Address
                    Name (_SUN, 0x62)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S4F0)
                {
                    Name (_ADR, 0x00030000)  // _ADR: Address
                    Name (_SUN, 0x63)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S5F0)
                {
                    Name (_ADR, 0x00040000)  // _ADR: Address
                    Name (_SUN, 0x64)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S6F0)
                {
                    Name (_ADR, 0x00050000)  // _ADR: Address
                    Name (_SUN, 0x65)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S7F0)
                {
                    Name (_ADR, 0x00060000)  // _ADR: Address
                    Name (_SUN, 0x66)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S8F0)
                {
                    Name (_ADR, 0x00070000)  // _ADR: Address
                    Name (_SUN, 0x67)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S9F0)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
                    Name (_SUN, 0x68)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S10F)
                {
                    Name (_ADR, 0x00090000)  // _ADR: Address
                    Name (_SUN, 0x69)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S11F)
                {
                    Name (_ADR, 0x000A0000)  // _ADR: Address
                    Name (_SUN, 0x6A)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S12F)
                {
                    Name (_ADR, 0x000B0000)  // _ADR: Address
                    Name (_SUN, 0x6B)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S13F)
                {
                    Name (_ADR, 0x000C0000)  // _ADR: Address
                    Name (_SUN, 0x6C)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S14F)
                {
                    Name (_ADR, 0x000D0000)  // _ADR: Address
                    Name (_SUN, 0x6D)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S15F)
                {
                    Name (_ADR, 0x000E0000)  // _ADR: Address
                    Name (_SUN, 0x6E)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S16F)
                {
                    Name (_ADR, 0x000F0000)  // _ADR: Address
                    Name (_SUN, 0x6F)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S17F)
                {
                    Name (_ADR, 0x00100000)  // _ADR: Address
                    Name (_SUN, 0x70)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S18F)
                {
                    Name (_ADR, 0x00110000)  // _ADR: Address
                    Name (_SUN, 0x71)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S19F)
                {
                    Name (_ADR, 0x00120000)  // _ADR: Address
                    Name (_SUN, 0x72)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S20F)
                {
                    Name (_ADR, 0x00130000)  // _ADR: Address
                    Name (_SUN, 0x73)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S21F)
                {
                    Name (_ADR, 0x00140000)  // _ADR: Address
                    Name (_SUN, 0x74)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S22F)
                {
                    Name (_ADR, 0x00150000)  // _ADR: Address
                    Name (_SUN, 0x75)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S23F)
                {
                    Name (_ADR, 0x00160000)  // _ADR: Address
                    Name (_SUN, 0x76)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S24F)
                {
                    Name (_ADR, 0x00170000)  // _ADR: Address
                    Name (_SUN, 0x77)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S25F)
                {
                    Name (_ADR, 0x00180000)  // _ADR: Address
                    Name (_SUN, 0x78)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S26F)
                {
                    Name (_ADR, 0x00190000)  // _ADR: Address
                    Name (_SUN, 0x79)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S27F)
                {
                    Name (_ADR, 0x001A0000)  // _ADR: Address
                    Name (_SUN, 0x7A)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S28F)
                {
                    Name (_ADR, 0x001B0000)  // _ADR: Address
                    Name (_SUN, 0x7B)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S29F)
                {
                    Name (_ADR, 0x001C0000)  // _ADR: Address
                    Name (_SUN, 0x7C)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S30F)
                {
                    Name (_ADR, 0x001D0000)  // _ADR: Address
                    Name (_SUN, 0x7D)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S31F)
                {
                    Name (_ADR, 0x001E0000)  // _ADR: Address
                    Name (_SUN, 0x7E)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S32F)
                {
                    Name (_ADR, 0x001F0000)  // _ADR: Address
                    Name (_SUN, 0x7F)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (P2P3)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x079015AD), 0x0F))
                }

                Method (OSHP, 0, NotSerialized)
                {
                    PSHP (_ADR)
                }

                Method (PPHR, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LNot (Local0))
                    {
                        Notify (S1F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S2F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S3F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S4F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S5F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S6F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S7F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S8F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S9F0, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S10F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S11F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S12F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S13F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S14F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S15F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S16F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S17F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S18F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S19F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S20F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S21F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S22F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S23F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S24F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S25F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S26F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S27F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S28F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S29F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S30F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S31F, Arg1)
                    }

                    If (LNot (Decrement (Local0)))
                    {
                        Notify (S32F, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x80)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S2F0)
                {
                    Name (_ADR, 0x00010000)  // _ADR: Address
                    Name (_SUN, 0x81)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S3F0)
                {
                    Name (_ADR, 0x00020000)  // _ADR: Address
                    Name (_SUN, 0x82)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S4F0)
                {
                    Name (_ADR, 0x00030000)  // _ADR: Address
                    Name (_SUN, 0x83)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S5F0)
                {
                    Name (_ADR, 0x00040000)  // _ADR: Address
                    Name (_SUN, 0x84)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S6F0)
                {
                    Name (_ADR, 0x00050000)  // _ADR: Address
                    Name (_SUN, 0x85)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S7F0)
                {
                    Name (_ADR, 0x00060000)  // _ADR: Address
                    Name (_SUN, 0x86)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S8F0)
                {
                    Name (_ADR, 0x00070000)  // _ADR: Address
                    Name (_SUN, 0x87)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S9F0)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
                    Name (_SUN, 0x88)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S10F)
                {
                    Name (_ADR, 0x00090000)  // _ADR: Address
                    Name (_SUN, 0x89)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S11F)
                {
                    Name (_ADR, 0x000A0000)  // _ADR: Address
                    Name (_SUN, 0x8A)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S12F)
                {
                    Name (_ADR, 0x000B0000)  // _ADR: Address
                    Name (_SUN, 0x8B)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S13F)
                {
                    Name (_ADR, 0x000C0000)  // _ADR: Address
                    Name (_SUN, 0x8C)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S14F)
                {
                    Name (_ADR, 0x000D0000)  // _ADR: Address
                    Name (_SUN, 0x8D)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S15F)
                {
                    Name (_ADR, 0x000E0000)  // _ADR: Address
                    Name (_SUN, 0x8E)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S16F)
                {
                    Name (_ADR, 0x000F0000)  // _ADR: Address
                    Name (_SUN, 0x8F)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S17F)
                {
                    Name (_ADR, 0x00100000)  // _ADR: Address
                    Name (_SUN, 0x90)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S18F)
                {
                    Name (_ADR, 0x00110000)  // _ADR: Address
                    Name (_SUN, 0x91)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S19F)
                {
                    Name (_ADR, 0x00120000)  // _ADR: Address
                    Name (_SUN, 0x92)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S20F)
                {
                    Name (_ADR, 0x00130000)  // _ADR: Address
                    Name (_SUN, 0x93)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S21F)
                {
                    Name (_ADR, 0x00140000)  // _ADR: Address
                    Name (_SUN, 0x94)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S22F)
                {
                    Name (_ADR, 0x00150000)  // _ADR: Address
                    Name (_SUN, 0x95)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S23F)
                {
                    Name (_ADR, 0x00160000)  // _ADR: Address
                    Name (_SUN, 0x96)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S24F)
                {
                    Name (_ADR, 0x00170000)  // _ADR: Address
                    Name (_SUN, 0x97)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S25F)
                {
                    Name (_ADR, 0x00180000)  // _ADR: Address
                    Name (_SUN, 0x98)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S26F)
                {
                    Name (_ADR, 0x00190000)  // _ADR: Address
                    Name (_SUN, 0x99)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S27F)
                {
                    Name (_ADR, 0x001A0000)  // _ADR: Address
                    Name (_SUN, 0x9A)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S28F)
                {
                    Name (_ADR, 0x001B0000)  // _ADR: Address
                    Name (_SUN, 0x9B)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S29F)
                {
                    Name (_ADR, 0x001C0000)  // _ADR: Address
                    Name (_SUN, 0x9C)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S30F)
                {
                    Name (_ADR, 0x001D0000)  // _ADR: Address
                    Name (_SUN, 0x9D)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S31F)
                {
                    Name (_ADR, 0x001E0000)  // _ADR: Address
                    Name (_SUN, 0x9E)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }

                Device (S32F)
                {
                    Name (_ADR, 0x001F0000)  // _ADR: Address
                    Name (_SUN, 0x9F)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, _ADR)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, _ADR))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE40)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xA0)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE50)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xC0)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE60)
            {
                Name (_ADR, 0x00170000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xE0)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE70)
            {
                Name (_ADR, 0x00180000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0100)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE80)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0120)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE90)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0140)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEA0)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0160)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEB0)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0180)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEC0)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x01A0)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PED0)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x01C0)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEE0)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x01E0)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE41)
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xA1)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE42)
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xA2)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE43)
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xA3)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE44)
            {
                Name (_ADR, 0x00150004)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xA4)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE45)
            {
                Name (_ADR, 0x00150005)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xA5)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE46)
            {
                Name (_ADR, 0x00150006)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xA6)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE47)
            {
                Name (_ADR, 0x00150007)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xA7)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE51)
            {
                Name (_ADR, 0x00160001)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xC1)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE52)
            {
                Name (_ADR, 0x00160002)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xC2)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE53)
            {
                Name (_ADR, 0x00160003)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xC3)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE54)
            {
                Name (_ADR, 0x00160004)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xC4)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE55)
            {
                Name (_ADR, 0x00160005)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xC5)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE56)
            {
                Name (_ADR, 0x00160006)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xC6)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE57)
            {
                Name (_ADR, 0x00160007)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xC7)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE61)
            {
                Name (_ADR, 0x00170001)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xE1)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE62)
            {
                Name (_ADR, 0x00170002)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xE2)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE63)
            {
                Name (_ADR, 0x00170003)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xE3)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE64)
            {
                Name (_ADR, 0x00170004)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xE4)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE65)
            {
                Name (_ADR, 0x00170005)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xE5)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE66)
            {
                Name (_ADR, 0x00170006)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xE6)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE67)
            {
                Name (_ADR, 0x00170007)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0xE7)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE71)
            {
                Name (_ADR, 0x00180001)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0101)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE72)
            {
                Name (_ADR, 0x00180002)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0102)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE73)
            {
                Name (_ADR, 0x00180003)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0103)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE74)
            {
                Name (_ADR, 0x00180004)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0104)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE75)
            {
                Name (_ADR, 0x00180005)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0105)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE76)
            {
                Name (_ADR, 0x00180006)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0106)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE77)
            {
                Name (_ADR, 0x00180007)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0107)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE81)
            {
                Name (_ADR, 0x00190001)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0121)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE82)
            {
                Name (_ADR, 0x00190002)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0122)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE83)
            {
                Name (_ADR, 0x00190003)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0123)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE84)
            {
                Name (_ADR, 0x00190004)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0124)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE85)
            {
                Name (_ADR, 0x00190005)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0125)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE86)
            {
                Name (_ADR, 0x00190006)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0126)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE87)
            {
                Name (_ADR, 0x00190007)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0127)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE91)
            {
                Name (_ADR, 0x001A0001)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0141)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE92)
            {
                Name (_ADR, 0x001A0002)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0142)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE93)
            {
                Name (_ADR, 0x001A0003)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0143)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE94)
            {
                Name (_ADR, 0x001A0004)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0144)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE95)
            {
                Name (_ADR, 0x001A0005)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0145)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE96)
            {
                Name (_ADR, 0x001A0006)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0146)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PE97)
            {
                Name (_ADR, 0x001A0007)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0147)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEA1)
            {
                Name (_ADR, 0x001B0001)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0161)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEA2)
            {
                Name (_ADR, 0x001B0002)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0162)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEA3)
            {
                Name (_ADR, 0x001B0003)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0163)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEA4)
            {
                Name (_ADR, 0x001B0004)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0164)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEA5)
            {
                Name (_ADR, 0x001B0005)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0165)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEA6)
            {
                Name (_ADR, 0x001B0006)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0166)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEA7)
            {
                Name (_ADR, 0x001B0007)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0167)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEB1)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0181)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEB2)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0182)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEB3)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0183)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEB4)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0184)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEB5)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0185)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEB6)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0186)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }

            Device (PEB7)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
                {
                    0x08, 
                    0x40, 
                    0x01, 
                    0x00
                })
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x03, 
                    0x03
                })
                Method (BSTA, 1, NotSerialized)
                {
                    Return (PSTA (_STA (), Arg0))
                }

                Method (BEJ0, 2, NotSerialized)
                {
                    PEJ0 (Arg0, Arg1, _ADR)
                }

                Method (BDSM, 5, Serialized)
                {
                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Arg4, _ADR))
                }

                OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                Field (REGS, DWordAcc, NoLock, Preserve)
                {
                    ID,     32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (And (LEqual (ID, 0x07A015AD), 0x0F))
                }

                Method (PPHR, 2, NotSerialized)
                {
                    If (LNot (Arg0))
                    {
                        Notify (S1F0, Arg1)
                    }
                }

                Device (S1F0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x0187)  // _SUN: Slot User Number
                    OperationRegion (REGS, PCI_Config, 0x00, 0x04)
                    Field (REGS, DWordAcc, NoLock, Preserve)
                    {
                        ID,     32
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (BSTA (ID))
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        BEJ0 (Arg0, Zero)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Return (BDSM (Arg0, Arg1, Arg2, Arg3, Zero))
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x03, 
                        0x03
                    })
                }
            }
        }

        Method (AWAK, 0, Serialized)
        {
            Store (0xFFFFFFFF, ACKW) /* \_SB_.ACKW */
        }

        Device (LID)
        {
            Name (_HID, "PNP0C0D" /* Lid Device */)  // _HID: Hardware ID
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x09, 
                0x04
            })
            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
            }

            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Return (LDST) /* \_SB_.LDST */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (And (BFEA (), 0x04))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (0x00)
                }
            }
        }

        Method (DQUE, 0, Serialized)
        {
            Store (QCMD, Local0)
            Store (QQUA, Local1)
            Store (QDAT, Local2)
            If (LEqual (Local0, 0x01))
            {
                Store (L1MX (Local2, Local1), QSTA) /* \_SB_.QSTA */
            }
            Else
            {
                If (LEqual (Local0, 0x02))
                {
                    Store (CNOT (Local1, Local2), QSTA) /* \_SB_.QSTA */
                }
                Else
                {
                    If (LEqual (Local0, 0x03))
                    {
                        If (LEqual (Local1, 0x01))
                        {
                            Notify (\_SB.SLPB, 0x80) // Status Change
                            Store (0x01, QSTA) /* \_SB_.QSTA */
                        }
                        Else
                        {
                            If (LEqual (Local1, 0x03))
                            {
                                Notify (\_SB.LID, 0x80) // Status Change
                                Store (0x03, QSTA) /* \_SB_.QSTA */
                            }
                            Else
                            {
                                Store (0xFFFFFFFE, QSTA) /* \_SB_.QSTA */
                            }
                        }
                    }
                    Else
                    {
                        If (LEqual (Local0, 0x04))
                        {
                            Notify (\_SB.PCI0.VMGC, 0x80) // Status Change
                            Store (0x01, QSTA) /* \_SB_.QSTA */
                        }
                        Else
                        {
                            Store (0xFFFFFFFF, QSTA) /* \_SB_.QSTA */
                        }
                    }
                }
            }
        }
    }

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            \_SB.PCI0.DVHP ()
        }

        Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            \_SB.DQUE ()
        }

        Method (_L03, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            \_SB.AWAK ()
        }
    }

    Scope (\_SB)
    {
        Processor (CP7F, 0x7F, 0x00001010, 0x06)
        {
            Name (CPID, 0x7F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP7E, 0x7E, 0x00001010, 0x06)
        {
            Name (CPID, 0x7E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP7D, 0x7D, 0x00001010, 0x06)
        {
            Name (CPID, 0x7D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP7C, 0x7C, 0x00001010, 0x06)
        {
            Name (CPID, 0x7C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP7B, 0x7B, 0x00001010, 0x06)
        {
            Name (CPID, 0x7B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP7A, 0x7A, 0x00001010, 0x06)
        {
            Name (CPID, 0x7A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP79, 0x79, 0x00001010, 0x06)
        {
            Name (CPID, 0x79)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP78, 0x78, 0x00001010, 0x06)
        {
            Name (CPID, 0x78)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP77, 0x77, 0x00001010, 0x06)
        {
            Name (CPID, 0x77)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP76, 0x76, 0x00001010, 0x06)
        {
            Name (CPID, 0x76)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP75, 0x75, 0x00001010, 0x06)
        {
            Name (CPID, 0x75)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP74, 0x74, 0x00001010, 0x06)
        {
            Name (CPID, 0x74)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP73, 0x73, 0x00001010, 0x06)
        {
            Name (CPID, 0x73)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP72, 0x72, 0x00001010, 0x06)
        {
            Name (CPID, 0x72)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP71, 0x71, 0x00001010, 0x06)
        {
            Name (CPID, 0x71)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP70, 0x70, 0x00001010, 0x06)
        {
            Name (CPID, 0x70)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP6F, 0x6F, 0x00001010, 0x06)
        {
            Name (CPID, 0x6F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP6E, 0x6E, 0x00001010, 0x06)
        {
            Name (CPID, 0x6E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP6D, 0x6D, 0x00001010, 0x06)
        {
            Name (CPID, 0x6D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP6C, 0x6C, 0x00001010, 0x06)
        {
            Name (CPID, 0x6C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP6B, 0x6B, 0x00001010, 0x06)
        {
            Name (CPID, 0x6B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP6A, 0x6A, 0x00001010, 0x06)
        {
            Name (CPID, 0x6A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP69, 0x69, 0x00001010, 0x06)
        {
            Name (CPID, 0x69)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP68, 0x68, 0x00001010, 0x06)
        {
            Name (CPID, 0x68)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP67, 0x67, 0x00001010, 0x06)
        {
            Name (CPID, 0x67)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP66, 0x66, 0x00001010, 0x06)
        {
            Name (CPID, 0x66)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP65, 0x65, 0x00001010, 0x06)
        {
            Name (CPID, 0x65)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP64, 0x64, 0x00001010, 0x06)
        {
            Name (CPID, 0x64)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP63, 0x63, 0x00001010, 0x06)
        {
            Name (CPID, 0x63)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP62, 0x62, 0x00001010, 0x06)
        {
            Name (CPID, 0x62)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP61, 0x61, 0x00001010, 0x06)
        {
            Name (CPID, 0x61)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP60, 0x60, 0x00001010, 0x06)
        {
            Name (CPID, 0x60)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP5F, 0x5F, 0x00001010, 0x06)
        {
            Name (CPID, 0x5F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP5E, 0x5E, 0x00001010, 0x06)
        {
            Name (CPID, 0x5E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP5D, 0x5D, 0x00001010, 0x06)
        {
            Name (CPID, 0x5D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP5C, 0x5C, 0x00001010, 0x06)
        {
            Name (CPID, 0x5C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP5B, 0x5B, 0x00001010, 0x06)
        {
            Name (CPID, 0x5B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP5A, 0x5A, 0x00001010, 0x06)
        {
            Name (CPID, 0x5A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP59, 0x59, 0x00001010, 0x06)
        {
            Name (CPID, 0x59)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP58, 0x58, 0x00001010, 0x06)
        {
            Name (CPID, 0x58)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP57, 0x57, 0x00001010, 0x06)
        {
            Name (CPID, 0x57)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP56, 0x56, 0x00001010, 0x06)
        {
            Name (CPID, 0x56)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP55, 0x55, 0x00001010, 0x06)
        {
            Name (CPID, 0x55)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP54, 0x54, 0x00001010, 0x06)
        {
            Name (CPID, 0x54)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP53, 0x53, 0x00001010, 0x06)
        {
            Name (CPID, 0x53)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP52, 0x52, 0x00001010, 0x06)
        {
            Name (CPID, 0x52)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP51, 0x51, 0x00001010, 0x06)
        {
            Name (CPID, 0x51)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP50, 0x50, 0x00001010, 0x06)
        {
            Name (CPID, 0x50)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP4F, 0x4F, 0x00001010, 0x06)
        {
            Name (CPID, 0x4F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP4E, 0x4E, 0x00001010, 0x06)
        {
            Name (CPID, 0x4E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP4D, 0x4D, 0x00001010, 0x06)
        {
            Name (CPID, 0x4D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP4C, 0x4C, 0x00001010, 0x06)
        {
            Name (CPID, 0x4C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP4B, 0x4B, 0x00001010, 0x06)
        {
            Name (CPID, 0x4B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP4A, 0x4A, 0x00001010, 0x06)
        {
            Name (CPID, 0x4A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP49, 0x49, 0x00001010, 0x06)
        {
            Name (CPID, 0x49)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP48, 0x48, 0x00001010, 0x06)
        {
            Name (CPID, 0x48)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP47, 0x47, 0x00001010, 0x06)
        {
            Name (CPID, 0x47)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP46, 0x46, 0x00001010, 0x06)
        {
            Name (CPID, 0x46)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP45, 0x45, 0x00001010, 0x06)
        {
            Name (CPID, 0x45)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP44, 0x44, 0x00001010, 0x06)
        {
            Name (CPID, 0x44)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP43, 0x43, 0x00001010, 0x06)
        {
            Name (CPID, 0x43)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP42, 0x42, 0x00001010, 0x06)
        {
            Name (CPID, 0x42)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP41, 0x41, 0x00001010, 0x06)
        {
            Name (CPID, 0x41)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP40, 0x40, 0x00001010, 0x06)
        {
            Name (CPID, 0x40)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP3F, 0x3F, 0x00001010, 0x06)
        {
            Name (CPID, 0x3F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP3E, 0x3E, 0x00001010, 0x06)
        {
            Name (CPID, 0x3E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP3D, 0x3D, 0x00001010, 0x06)
        {
            Name (CPID, 0x3D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP3C, 0x3C, 0x00001010, 0x06)
        {
            Name (CPID, 0x3C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP3B, 0x3B, 0x00001010, 0x06)
        {
            Name (CPID, 0x3B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP3A, 0x3A, 0x00001010, 0x06)
        {
            Name (CPID, 0x3A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP39, 0x39, 0x00001010, 0x06)
        {
            Name (CPID, 0x39)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP38, 0x38, 0x00001010, 0x06)
        {
            Name (CPID, 0x38)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP37, 0x37, 0x00001010, 0x06)
        {
            Name (CPID, 0x37)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP36, 0x36, 0x00001010, 0x06)
        {
            Name (CPID, 0x36)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP35, 0x35, 0x00001010, 0x06)
        {
            Name (CPID, 0x35)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP34, 0x34, 0x00001010, 0x06)
        {
            Name (CPID, 0x34)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP33, 0x33, 0x00001010, 0x06)
        {
            Name (CPID, 0x33)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP32, 0x32, 0x00001010, 0x06)
        {
            Name (CPID, 0x32)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP31, 0x31, 0x00001010, 0x06)
        {
            Name (CPID, 0x31)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP30, 0x30, 0x00001010, 0x06)
        {
            Name (CPID, 0x30)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP2F, 0x2F, 0x00001010, 0x06)
        {
            Name (CPID, 0x2F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP2E, 0x2E, 0x00001010, 0x06)
        {
            Name (CPID, 0x2E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP2D, 0x2D, 0x00001010, 0x06)
        {
            Name (CPID, 0x2D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP2C, 0x2C, 0x00001010, 0x06)
        {
            Name (CPID, 0x2C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP2B, 0x2B, 0x00001010, 0x06)
        {
            Name (CPID, 0x2B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP2A, 0x2A, 0x00001010, 0x06)
        {
            Name (CPID, 0x2A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP29, 0x29, 0x00001010, 0x06)
        {
            Name (CPID, 0x29)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP28, 0x28, 0x00001010, 0x06)
        {
            Name (CPID, 0x28)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP27, 0x27, 0x00001010, 0x06)
        {
            Name (CPID, 0x27)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP26, 0x26, 0x00001010, 0x06)
        {
            Name (CPID, 0x26)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP25, 0x25, 0x00001010, 0x06)
        {
            Name (CPID, 0x25)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP24, 0x24, 0x00001010, 0x06)
        {
            Name (CPID, 0x24)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP23, 0x23, 0x00001010, 0x06)
        {
            Name (CPID, 0x23)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP22, 0x22, 0x00001010, 0x06)
        {
            Name (CPID, 0x22)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP21, 0x21, 0x00001010, 0x06)
        {
            Name (CPID, 0x21)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP20, 0x20, 0x00001010, 0x06)
        {
            Name (CPID, 0x20)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP1F, 0x1F, 0x00001010, 0x06)
        {
            Name (CPID, 0x1F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP1E, 0x1E, 0x00001010, 0x06)
        {
            Name (CPID, 0x1E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP1D, 0x1D, 0x00001010, 0x06)
        {
            Name (CPID, 0x1D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP1C, 0x1C, 0x00001010, 0x06)
        {
            Name (CPID, 0x1C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP1B, 0x1B, 0x00001010, 0x06)
        {
            Name (CPID, 0x1B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP1A, 0x1A, 0x00001010, 0x06)
        {
            Name (CPID, 0x1A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP19, 0x19, 0x00001010, 0x06)
        {
            Name (CPID, 0x19)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP18, 0x18, 0x00001010, 0x06)
        {
            Name (CPID, 0x18)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP17, 0x17, 0x00001010, 0x06)
        {
            Name (CPID, 0x17)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP16, 0x16, 0x00001010, 0x06)
        {
            Name (CPID, 0x16)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP15, 0x15, 0x00001010, 0x06)
        {
            Name (CPID, 0x15)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP14, 0x14, 0x00001010, 0x06)
        {
            Name (CPID, 0x14)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP13, 0x13, 0x00001010, 0x06)
        {
            Name (CPID, 0x13)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP12, 0x12, 0x00001010, 0x06)
        {
            Name (CPID, 0x12)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP11, 0x11, 0x00001010, 0x06)
        {
            Name (CPID, 0x11)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP10, 0x10, 0x00001010, 0x06)
        {
            Name (CPID, 0x10)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP0F, 0x0F, 0x00001010, 0x06)
        {
            Name (CPID, 0x0F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP0E, 0x0E, 0x00001010, 0x06)
        {
            Name (CPID, 0x0E)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP0D, 0x0D, 0x00001010, 0x06)
        {
            Name (CPID, 0x0D)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP0C, 0x0C, 0x00001010, 0x06)
        {
            Name (CPID, 0x0C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP0B, 0x0B, 0x00001010, 0x06)
        {
            Name (CPID, 0x0B)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP0A, 0x0A, 0x00001010, 0x06)
        {
            Name (CPID, 0x0A)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP09, 0x09, 0x00001010, 0x06)
        {
            Name (CPID, 0x09)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP08, 0x08, 0x00001010, 0x06)
        {
            Name (CPID, 0x08)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP07, 0x07, 0x00001010, 0x06)
        {
            Name (CPID, 0x07)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP06, 0x06, 0x00001010, 0x06)
        {
            Name (CPID, 0x06)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP05, 0x05, 0x00001010, 0x06)
        {
            Name (CPID, 0x05)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP04, 0x04, 0x00001010, 0x06)
        {
            Name (CPID, 0x04)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP03, 0x03, 0x00001010, 0x06)
        {
            Name (CPID, 0x03)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP02, 0x02, 0x00001010, 0x06)
        {
            Name (CPID, 0x02)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (\_SB)
    {
        Processor (CP01, 0x01, 0x00001010, 0x06)
        {
            Name (CPID, 0x01)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (CSTA (CPID))
            }

            Method (_MAT, 0, NotSerialized)  // _MAT: Multiple APIC Table Entry
            {
                Return (CMAT (CPID))
            }

            Method (_PXM, 0, NotSerialized)  // _PXM: Device Proximity
            {
                Return (CPXM (CPID))
            }

            Method (XEJ0, 1, NotSerialized)
            {
                CEJ0 (CPID, Arg0)
            }
        }
    }

    Scope (_SB)
    {
        Method (CNOT, 2, NotSerialized)
        {
            If (LEqual (Arg1, 0x7F))
            {
                Notify (CP7F, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x7E))
            {
                Notify (CP7E, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x7D))
            {
                Notify (CP7D, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x7C))
            {
                Notify (CP7C, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x7B))
            {
                Notify (CP7B, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x7A))
            {
                Notify (CP7A, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x79))
            {
                Notify (CP79, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x78))
            {
                Notify (CP78, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x77))
            {
                Notify (CP77, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x76))
            {
                Notify (CP76, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x75))
            {
                Notify (CP75, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x74))
            {
                Notify (CP74, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x73))
            {
                Notify (CP73, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x72))
            {
                Notify (CP72, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x71))
            {
                Notify (CP71, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x70))
            {
                Notify (CP70, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x6F))
            {
                Notify (CP6F, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x6E))
            {
                Notify (CP6E, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x6D))
            {
                Notify (CP6D, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x6C))
            {
                Notify (CP6C, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x6B))
            {
                Notify (CP6B, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x6A))
            {
                Notify (CP6A, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x69))
            {
                Notify (CP69, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x68))
            {
                Notify (CP68, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x67))
            {
                Notify (CP67, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x66))
            {
                Notify (CP66, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x65))
            {
                Notify (CP65, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x64))
            {
                Notify (CP64, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x63))
            {
                Notify (CP63, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x62))
            {
                Notify (CP62, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x61))
            {
                Notify (CP61, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x60))
            {
                Notify (CP60, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x5F))
            {
                Notify (CP5F, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x5E))
            {
                Notify (CP5E, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x5D))
            {
                Notify (CP5D, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x5C))
            {
                Notify (CP5C, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x5B))
            {
                Notify (CP5B, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x5A))
            {
                Notify (CP5A, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x59))
            {
                Notify (CP59, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x58))
            {
                Notify (CP58, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x57))
            {
                Notify (CP57, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x56))
            {
                Notify (CP56, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x55))
            {
                Notify (CP55, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x54))
            {
                Notify (CP54, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x53))
            {
                Notify (CP53, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x52))
            {
                Notify (CP52, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x51))
            {
                Notify (CP51, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x50))
            {
                Notify (CP50, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x4F))
            {
                Notify (CP4F, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x4E))
            {
                Notify (CP4E, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x4D))
            {
                Notify (CP4D, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x4C))
            {
                Notify (CP4C, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x4B))
            {
                Notify (CP4B, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x4A))
            {
                Notify (CP4A, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x49))
            {
                Notify (CP49, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x48))
            {
                Notify (CP48, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x47))
            {
                Notify (CP47, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x46))
            {
                Notify (CP46, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x45))
            {
                Notify (CP45, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x44))
            {
                Notify (CP44, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x43))
            {
                Notify (CP43, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x42))
            {
                Notify (CP42, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x41))
            {
                Notify (CP41, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x40))
            {
                Notify (CP40, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x3F))
            {
                Notify (CP3F, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x3E))
            {
                Notify (CP3E, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x3D))
            {
                Notify (CP3D, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x3C))
            {
                Notify (CP3C, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x3B))
            {
                Notify (CP3B, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x3A))
            {
                Notify (CP3A, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x39))
            {
                Notify (CP39, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x38))
            {
                Notify (CP38, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x37))
            {
                Notify (CP37, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x36))
            {
                Notify (CP36, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x35))
            {
                Notify (CP35, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x34))
            {
                Notify (CP34, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x33))
            {
                Notify (CP33, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x32))
            {
                Notify (CP32, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x31))
            {
                Notify (CP31, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x30))
            {
                Notify (CP30, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x2F))
            {
                Notify (CP2F, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x2E))
            {
                Notify (CP2E, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x2D))
            {
                Notify (CP2D, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x2C))
            {
                Notify (CP2C, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x2B))
            {
                Notify (CP2B, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x2A))
            {
                Notify (CP2A, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x29))
            {
                Notify (CP29, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x28))
            {
                Notify (CP28, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x27))
            {
                Notify (CP27, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x26))
            {
                Notify (CP26, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x25))
            {
                Notify (CP25, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x24))
            {
                Notify (CP24, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x23))
            {
                Notify (CP23, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x22))
            {
                Notify (CP22, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x21))
            {
                Notify (CP21, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x20))
            {
                Notify (CP20, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x1F))
            {
                Notify (CP1F, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x1E))
            {
                Notify (CP1E, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x1D))
            {
                Notify (CP1D, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x1C))
            {
                Notify (CP1C, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x1B))
            {
                Notify (CP1B, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x1A))
            {
                Notify (CP1A, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x19))
            {
                Notify (CP19, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x18))
            {
                Notify (CP18, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x17))
            {
                Notify (CP17, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x16))
            {
                Notify (CP16, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x15))
            {
                Notify (CP15, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x14))
            {
                Notify (CP14, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x13))
            {
                Notify (CP13, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x12))
            {
                Notify (CP12, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x11))
            {
                Notify (CP11, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x10))
            {
                Notify (CP10, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x0F))
            {
                Notify (CP0F, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x0E))
            {
                Notify (CP0E, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x0D))
            {
                Notify (CP0D, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x0C))
            {
                Notify (CP0C, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x0B))
            {
                Notify (CP0B, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x0A))
            {
                Notify (CP0A, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x09))
            {
                Notify (CP09, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x08))
            {
                Notify (CP08, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x07))
            {
                Notify (CP07, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x06))
            {
                Notify (CP06, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x05))
            {
                Notify (CP05, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x04))
            {
                Notify (CP04, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x03))
            {
                Notify (CP03, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x02))
            {
                Notify (CP02, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x01))
            {
                Notify (CP01, Arg0)
                Return (Zero)
            }

            If (LEqual (Arg1, 0x00))
            {
                Notify (CP00, Arg0)
                Return (Zero)
            }

            Return (0xFFFFFFFE)
        }
    }
}

