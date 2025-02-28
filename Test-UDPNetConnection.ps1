function Test-UDPNetConnection {
    <#
    
    .SYNOPSIS
    Sends a UDP message to a specified IP address and port.

    .DESCRIPTION
    This PowerShell script sends a predefined UDP message to a specified IP address and port.
    It creates a UDP client, encodes the message into a byte array, and sends it to the target address.
    The script checks if the number of sent bytes matches the message length and outputs the status.

    .PARAMETER remoteip
    The IP address of the remote target. Default: "127.0.0.1".

    .PARAMETER remoteudpport
    The UDP port of the remote target. Default: 2001.

    .PARAMETER sourceudpport
    The UDP port of the source. Default: 0. => 0 will take any free port

    .PARAMETER buffer
    The message to be sent. Default: "SendUDP Message duz huund".

    .EXAMPLE
    .\SendUDPPacket.ps1 -remoteip "192.168.1.1" -remoteudpport 3000 -buffer "Hello, World!"

    .NOTES
    Author: Tom Feldmann
    Version: 1.0
    Date: 2025-02-28
    
    #>
    



	param (
	   [string]$remoteip = "127.0.0.1",
	   [int]$remoteudpport=2001,
	   [int]$sourceudpport = 0,
	   [string]$buffer = "SendUDP Message to a udp port"
	)

	$udpClient = new-Object system.Net.Sockets.Udpclient(0) 
	$byteBuffer  = [System.Text.Encoding]::ASCII.GetBytes("SendUDP Message duz huund")
	$sendbytes = $udpClient.Send($byteBuffer, $byteBuffer.length, $remoteip, $remoteudpport)
	if ($sendbytes -ne $byteBuffer.length) {
	   Write-Host "Mismatch bytes" -ForegroundColor red
	} else {
		Write-Host "All bytes Success (Port: $remoteudpport)" -ForegroundColor Green
	}
}