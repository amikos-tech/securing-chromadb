import base64
from chromadb import Settings, HttpClient

def test_client():
    # basic auth - base64 encoded username:password
    credentials = base64.b64encode(b'testuser:testpassword').decode('utf-8')
    client = HttpClient(host='localhost', port=8443, ssl=True,headers={'Authorization': f'Basic {credentials}'})
    client._session.verify = False #this is a workaround as Chroma client does not yet support self-signed certificates
    print(client.heartbeat())
    
if __name__ == '__main__':
    test_client()