# Instruction
In order to run the example, follow these steps from the root folder:
1. Run `./gen-httppass.sh` to generate a basic authentication credentials to secure the services
2. Run `docker-compose up` to build & start the containers
3. From the command line, send a request to the Gateway:
```
curl "http://<uname>:<password>@localhost:9000/message/Somename" -H "Host: service2.local"

```
Where:
* uname: Username of the basic authentication done in step 1
* password: Password of the basic authentication done in step 1

What happens when that request is executed:
1. The request will reach the Gateway which is the Nginx container
2. Nginx container will check the basic authentication with the provided username/password in the URL
3. If the authentication is corect, it'll route the request to the respective service (service2 in this case). Otherwise, it'll reject with 401
