String PROG_NAME = "MAC_address_Processing";
String VERSION = "V0.1 ";
String PROJECT_URL = ""; 

// Author: Forrest Lee Erickson

//MAC Address: 74-27-EA-B3-1B-13
 
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

void setup() {

  try {
    Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
    while (interfaces.hasMoreElements()) {
      NetworkInterface networkInterface = interfaces.nextElement();
      byte[] mac = networkInterface.getHardwareAddress();
      if (mac != null) {
        printMacAddress(mac);
      }
    }
  } catch (SocketException e) {
    println("Error getting network interfaces: " + e.getMessage());
  }
}

void printMacAddress(byte[] mac) {
  StringBuilder macString = new StringBuilder();
  for (int i = 0; i < mac.length; i++) {
    String hex = String.format("%02X", mac[i] & 0xFF);
    macString.append(hex).append("-");
  }
  // Remove the trailing hyphen
  macString.deleteCharAt(macString.length() - 1);
  println("MAC Address: " + macString.toString());
}
