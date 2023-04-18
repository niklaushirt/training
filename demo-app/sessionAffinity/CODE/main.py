import flask
import socket


def get_local_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # doesn't even have to be reachable
        s.connect(('192.255.255.255', 1))
        IP = s.getsockname()[0]
    except:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP
 
local_ip = get_local_ip()

hostname = socket.gethostname()
print("Your Computer Name is: "+hostname)
print("Your Computer IP Address is: "+local_ip)   


app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=['GET'])
def home():
 return "<h1>Demo Pod</h1><p>Your Computer Name is: "+hostname+"</p><p>Your Computer IP Address is: "+local_ip+" </p>"

@app.route('/ready', methods=['GET'])
def ready():
 return '{"status": "ready"}'

@app.route('/health', methods=['GET'])
def health():
 return '{"status": "healthy"}'


app.run(host="0.0.0.0")

