# wifi-qrdoc

Quick setup to generate PDF with wifi QR code on OpenBSD for easy client access.

## Usage

Install texlive and run `make`.

## Hints

- Assumes user is in group `wheel` to access `hostname.if`
- Changes permissions of local directory to user only access to avoid exposing wifi credentials to others
- Stores wifi credentials locally, run `make clean` to remove

## Example

![document with wifi qr code](wifi-qrdoc.png)
