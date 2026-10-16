import socket, struct, sys
sys.stdout.reconfigure(encoding='utf-8')

def rcon_cmd(command):
    host = '127.0.0.1'
    port = 25575
    password = 'skyblock123'
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(20.0)
    sock.connect((host, port))
    auth_bytes = password.encode('utf-8')
    sock.sendall(struct.pack('<iii', 10 + len(auth_bytes), 1, 3) + auth_bytes + b'\x00\x00')
    sock.recv(4096)

    cmd_bytes = command.encode('utf-8')
    sock.sendall(struct.pack('<iii', 10 + len(cmd_bytes), 2, 2) + cmd_bytes + b'\x00\x00')
    resp = sock.recv(16384)
    sock.close()
    return resp[12:-2].decode('utf-8', errors='ignore')

if __name__ == '__main__':
    cmd = ' '.join(sys.argv[1:]) if len(sys.argv) > 1 else 'list'
    print(rcon_cmd(cmd))
