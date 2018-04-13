# YEALINK REMOTE PHONE REBOOT OR PROVISION SCRIPT {BETA 2}
# <c> 2014
# https://github.com/Truvis/Yealink/

$ErrorActionPreference= 'silentlycontinue'
1..255 | %{
    $I = "192.168.2.$_"
    Get-MacAddress($I);
    function Get-MacAddress {
        param( [string]$device= $( throw "Please specify device" ) )
        if ( $device | ? { $_ -match "[0-9].[0-9].[0-9].[0-9]" } )
        {
          # searching by IP Address
          $ip = $device
        } else {
            # searching by Host Name
            $ip = [System.Net.Dns]::GetHostByName($device).AddressList[0].IpAddressToString
        }
        arp -d; # purge arp cache
        $ping = ( new-object System.Net.NetworkInformation.Ping ).Send($ip);
        $mac = arp -a;
        if($ping)
        {
            ( $mac | ? { $_ -match $ip } ) -match "([0-9A-F]{2}([:-][0-9A-F]{2}){5})" | out-null;
            # is this a match and valid host. is it up? 
            if ( $matches ) { # need to check if no mac then skip the rest
                $mac = $matches[0];
                # remove the last 8
                $final_mac=$mac.Remove(8, ($mac.Length -8))
                # is this a yealink mac
                if($final_mac -eq "00-15-65")
                {
                    # login to phone and run command
                    $user = 'admin'
                    $pass = 'tampa'
                    $pair = "$($user):$($pass)"
                    $encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
                    $basicAuthValue = "Basic $encodedCreds"
                    $Headers = @{
                        Authorization = $basicAuthValue
                    }
		            # Key=Reboot for reboot
                    $URL = "http://"+$IP+"/servlet?key=AutoP"
                    Invoke-WebRequest -Uri $URL -Headers $Headers
                    "Found Phone"
                    $IP
                    $mac
                    " "
                }
                else
                {
                    "Not a YeaLink Mac"
                    $IP
                    " "
                }
            } else {
                "No Mac Found At This IP"
            }
        }
    }
}
