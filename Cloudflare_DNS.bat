netsh interface ipv4 set dnsservers name="Ethernet" source=static address=1.1.1.1 validate=no
netsh interface ipv4 add dnsservers name="Ethernet" address=1.0.0.1 validate=no
netsh interface ipv4 set dnsservers name="Ethernet 2" source=static address=1.1.1.1 validate=no
netsh interface ipv4 add dnsservers name="Ethernet 2" address=1.0.0.1 validate=no
netsh interface ipv4 set dnsservers name="Ethernet 3" source=static address=1.1.1.1 validate=no
netsh interface ipv4 add dnsservers name="Ethernet 3" address=1.0.0.1 validate=no
netsh interface ipv4 set dnsservers name="Ethernet 4" source=static address=1.1.1.1 validate=no
netsh interface ipv4 add dnsservers name="Ethernet 4" address=1.0.0.1 validate=no
