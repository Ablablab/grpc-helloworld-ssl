openssl genrsa -passout pass:password -out ca.key 4096
openssl req -passin pass:password -new -x509 -key ca.key -out ca.crt -subj  "/C=IT/ST=Italy/L=Rome/O=GRPC/OU=GRPC/CN=Root CA"
openssl genrsa -passout pass:password -out server.key 4096
openssl req -passin pass:password -new -key server.key -out server.csr -subj  "/C=IT/ST=Italy/L=Rome/O=GRPC/OU=GRPC/CN=localhost"
openssl x509 -req -passin pass:password -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
openssl rsa -passin pass:password -in server.key -out server.key
openssl genrsa -passout pass:password -out client.key 4096
openssl req -passin pass:password -new -key client.key -out client.csr -subj  "/C=IT/ST=Italy/L=Rome/O=GRPC/OU=GRPC/CN=localhost"
openssl x509 -passin pass:password -req -in client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client.crt
openssl rsa -passin pass:password -in client.key -out client.key
