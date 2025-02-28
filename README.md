# Test-UDPNetConnection

## Overview

`Test-UDPNetConnection` is a PowerShell script that sends a UDP message to a specified IP address and port. It creates a UDP client, encodes the message into a byte array, and sends it to the target address. The script checks if the number of sent bytes matches the message length and outputs the status.

## Parameters

- `remoteip`: The IP address of the remote target. Default: `127.0.0.1`.
- `remoteudpport`: The UDP port of the remote target. Default: `2001`.
- `sourceudpport`: The UDP port of the source. Default: `0` (any free port).
- `buffer`: The message to be sent. Default: `SendUDP Message duz huund`.

## Example

```powershell
.\SendUDPPacket.ps1 -remoteip "192.168.1.1" -remoteudpport 3000 -buffer "Hello, World!"
