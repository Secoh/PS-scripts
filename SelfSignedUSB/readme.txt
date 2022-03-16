Copyright (2020) Secoh
Licensed under the Apache License, Version 2.0
http://www.apache.org/licenses/LICENSE-2.0
Distributed on an "as-is" basis, without warranties or
conditions of any kind.

Package to create self-signed certificates and use them
to sign customizations to generic Windows drivers.

Notably in case of USB-to-Serial custom controllers built
around a USB chip supported by standard USBSER.SYS driver,
device names, VID/PID pairs, manufacturer name, issue date,
all can be customized.

0. For detailed descriptions, refer to:
  .\reading\driver_custom_howto.txt
  .\reading\atmel_serial.txt

Useful tool for manipulating with Windows certificates:
run MMC in the command line

1. Create, refresh, import certificate to the system

Normally, CREATION of the new certificate is once-per-life
experience, at least for a given person, company, venture,
hobby area, etc.

Importing the certificate may be required to migrate
the working setup to a different computer.

If you don't have the certificate yet, edit
the file mock_cert.config first.

Cert-Name - the name that appears in the Windows certificate stores
Cert-File-Name - file name where certificate will be written
Valid-Years - Expiration period, starting from now
Key-Password - password to the private key
Extra-Subject-Symbols - if not empty, this string is mechanically
  added to SUBJECT field of the certificate. The string format
  and the designators MUST follow the X.509 standard.

To create new certificate, run create_root_certificate_or_import.bat
in Administrator mode. It will generate the new certificate in
appropriate Windows stores, and the public and the private
certificate files in base64 format.

If the certificate already exists in the Windows certificate
store, this script picks up the existing certificate and then
uses it for the rest of procedure. It may be useful if you need
to refresh or re-create PFX and CER files.

To import existing certificate to the clean computer, call:
create_root_certificate_or_import.bat <your-certificate>.pfx
The file name can be anything in any location on the file
system (later copied or renamed to the appropriate name), but
the name of the certificate itself must be the same as
the Cert-Name field in mock_cert.config file. The certificate
password must be the same as the Key-Password.

IMPORTANT. This program does have some protection from user
error, but it DOES NOT have defenses against intentional
misrepresentation. Invalid certificates will fail loading, or
fail password check, or, in the worst case scenario, will
leave the package in the error state. If such condition occurs,
delete all PFX and CER files from the script folder, delete
all offending certificates from Personal / Local Computer
store, and start over.

The log of the script is stored in file mock_cert.log.

2. Signing the INF driver

Before you sign the new INF file, you want to verify it
by command infverif.exe. It is normally downloaded as part of
Windows DDK/WDK, and in Windows 10, normally present in
C:\Program Files (x86)\Windows Kits\10\Tools\x86\

To sign INF, you need PFX and CER files in the script folder.
They were generated during creation, refreshing, or importing
the certificate. Run command:
create_installation_package.bat <your-file>.inf

The INF file can be in the script folder, or in any other
place. The script doesn't require Administrator privileges,
but both the script folder, and the INF file location,
must be writable.

If the command succeeds, it writes the installation package
to the original location of the INF file. It contains:
the INF file without changes, CAT file for it (driver signature),
CER certificate to be imported to the user system, and
brief description how to install. The package is in form of
compressed ISO image and has .iso.zip extension. ZIP files
can be opened in Windows as a folder, and ISO images can be
mounted in Windows 10 as a read-only drive letter.
