# Yealink
Cheatsheets and other Yealink Phone information.

# Programmable Key Cheatsheet

```For SIP-T48G/T48S/T46G/T46S IP phones:
When X=1, the default value is 28 (History).
When X=2, the default value is 61 (Directory).
When X=3, the default value is 5 (DND).
When X=4, the default value is 30 (Menu).
When X=5, the default value is 28 (History).
When X=6, the default value is 61 (Directory).
When X=7, the default value is 51 (Switch Account Up).
When X=8, the default value is 52 (Switch Account Down).
When X=9, the default value is 33 (Status).
When X=10, the default value is 0 (NA).
When X=12, the default value is 0 (NA).
When X=13, the default value is 0 (NA).
When X=14, the default value is 2 (Forward).```

For SIP-T42G/T42S/T41P/T41S/T40P IP phones:

```When X=1, the default value is 28 (History).
When X=2, the default value is 61 (Directory).
When X=3, the default value is 5 (DND).
When X=4, the default value is 30 (Menu).
When X=5, the default value is 28 (History).
When X=6, the default value is 61 (Directory).
When X=7, the default value is 51 (Switch Account Up).
When X=8, the default value is 52 (Switch Account Down).
When X=9, the default value is 33 (Status).
When X=10, the default value is 0 (NA).
When X=13, the default value is 0 (NA).```

For SIP-T29G/T27P/T27G IP phones:

```When X=1, the default value is 28 (History).
When X=2, the default value is 61 (Directory).
When X=3, the default value is 5 (DND).
When X=4, the default value is 30 (Menu).
When X=5, the default value is 28 (History).
When X=6, the default value is 61 (Directory).
When X=7, the default value is 51 (Switch Account Up).
When X=8, the default value is 52 (Switch Account Down).
When X=9, the default value is 33 (Status).
When X=10, the default value is 0 (NA).
When X=11, the default value is 0 (NA).
When X=12, the default value is 0 (NA).
When X=13, the default value is 0 (NA).
When X=14, the default value is 2 (Forward)
```

# Valid Programmable Key Types
```0-NA   
2-Forward   
5-DND   
7-Call Return   
8-SMS   
9-Directed Pickup   
13-Speed Dial
22-XML Group   
23-Group Pickup   
27-XML Browser   
28-History   
30-Menu   
31-Switch Account   
32-New SMS
33-Status   
34-Hot Desking   
38-LDAP   
40-Prefix   
41-Zero Touch   
43-Local Directory   
44-Network Directory   
45-Local Group
46-Network Group   
47-XML Directory   
50-Keypad Lock   
51-Switch Account Up   
52-Switch Account Down   
55-Meet-Me Conference   
61-Directory
```

# Distinctive Ring Provisioning
This will use the default built in ringer options. The text must also be set as the department in the users. If that depertment calls, it will use the text string to know what ringer to play.

```
account.1.alert_info_url_enable="1"
distinctive_ring_tones.alert_info.1.text="internal"
distinctive_ring_tones.alert_info.1.ringer="3"
```

# Wifi Provisioning
This can be copied and pasted for WIFI configuration on the phones. The phones must first be provisioned before they will automatically connect to the WIFI.

```
 static.wifi.enable="1"
 static.wifi.1.priority="5"
 static.wifi.1.label="MEOW"
 static.wifi.1.ssid="MEOW"
 static.wifi.1.security_mode="WPA2-PSK"
 static.wifi.1.cipher_type="AES"
 static.wifi.1.password="tampa2017"
```

# VPN Provisioning
The following are the current usable VPN options. Can use one or the other. Will require a reboot for the VPN to kick in. 

```
 network.vpn_enable="1"
 openvpn.url="https://vpn/t27_t29_t46.tar"
 ```

# Power Settings
Controls when the phone display will be kept on and go off. The values are in military time. Can be disabled if required. 

The following will turn the display on from 8am to 5pm. 

```
 features.power_saving.intelligent_mode="1"
 features.power_saving.enable="1"
 features.power_saving.office_hour.idle_timeout="120"
 features.power_saving.off_hour.idle_timeout="60"
 features.power_saving.office_hour.monday="8,18"
 features.power_saving.office_hour.tuesday="8,18"
 features.power_saving.office_hour.wednesday="8,18"
 features.power_saving.office_hour.thursday="8,18"
 features.power_saving.office_hour.friday="8,18"
 features.power_saving.office_hour.saturday="8,18"
 features.power_saving.office_hour.sunday="8,18"
```

