This are the SSDTs needed to work with my hackintosh!

I'm using the same iasl compiler version of the ACPI tables that are embedded in my BIOS: 20120711
In order to compile/decompile, we must be on Windows.
Download iasl compiler from here: https://github.com/acpica/acpica/raw/refs/tags/R07_11_12/libraries/iasl.exe

Right click on "iasl-win-20120711.zip" > 7-Zip > Extract to "iasl-win-20120711\"

Copy the ACPI tables into "C:\path\to\iasl-win-20120711"

Open CMD

> cd C:\path\to\iasl-win-20120711

To compile the SSDT source file (*.asl):
> iasl SSDT-MCHC.asl

This will generate a binary file (*.aml)



To decompile the SSDT binary file (*.aml):
> iasl -d SSDT-MCHC.aml

This will generate a disassembled file (*.dsl)





In order to disassemble a binary ACPI table with a custom method implementation (ie. Method XSEL to XSEM etc.)
we need to "Include ACPI table(s) for external symbol resolution". So we must include our "mod" DSDT.

But we can't do it with OpenCore Misc > Debug > SysReport option. This will dump the original OEM ACPI tables without any OC customizations applied.

To dump the OEM ACPI tables with OC customization applied, we have to copy EFI_debug into a FAT32 USB drive. Rename the folder to "EFI".

(Re)Boot, press F12 to show Boot menu, choose USB drive.
At OpenCore boot menu, quickly press spacebar key to show Auxiliary entries
Select "UEFI Shell"

Shell> FS0:
FS0:\> mkdir OpenCore_ACPI_tables
FS0:\> cd OpenCore_ACPI_tables
FS0:\OpenCore_ACPI_tables\> acpiview -d -s DSDT
FS0:\OpenCore_ACPI_tables\> acpiview -d -s SSDT

This command will dump DSDT and SSDTs patched tables in the current directory. Within this UEFI Shell, we achieve the "final ACPI configuration including all the patches and added tables".

REMEMBER: OpenCore will apply ACPI changes globally (to every operating system) with the following effective order: Delete, Quirks, Patch, Add

Reboot the system by typing:

FS0:\OpenCore_ACPI_tables\> reset -w

Boot Windows and copy the newly generated ACPI tables into the "C:\path\to\iasl-win-20120711"

Then, back to Windows in CMD

> iasl -d SSDT-XSEL.aml -e DSDT.aml

This will correctly generate a disassembled file (*.dsl)




Then, to create a listing file from a asl/dsl file:

> iasl -l SSDT-MCHC.asl

This command will create 2 files:
- SSDT-MCHC.lst
- SSDT-MCHC.aml
