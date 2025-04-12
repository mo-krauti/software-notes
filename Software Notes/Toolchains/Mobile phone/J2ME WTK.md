This is one of the original development setups of J2ME.

Using Ubuntu 20.04:
```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt-get install libxi6:i386 libxt6:i386 libxi6:i386 libxtst6:i386 libxext6:i386
```
Download [JDK 1.6 32bits](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html) and [Sun Java Wireless Toolkit 2.5.2_01](http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javame-419430.html)

```bash
./jdk-6u45-linux-i586.bin
sudo mkdir -p /usr/lib/jvm/
sudo mv  jdk1.6.0_45/ /usr/lib/jvm/
sudo chown -R root:root /usr/lib/jvm/
./sun_java_wireless_toolkit-2.5.2_01-linuxi486.bin.sh
# set java path to /usr/lib/jvm/jdk1.6.0_45/bin

./WTK2.5.2/bin/ktoolbar
```
