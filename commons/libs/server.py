import os
from socket import *

if __name__=="__main__":
	host = ""
	port = 13000
	buf = 1024
	addr = (host, port)
	udp_socket = socket(AF_INET, SOCK_DGRAM)
	udp_socket.bind(addr)
	while True:
		(data, addr) = udp_socket.recvfrom(buf)
		print "Received message: " + data
		if data == "exit":
			break
	udp_socket.close()
	os._exit(0)