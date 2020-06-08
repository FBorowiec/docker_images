# Docker Images

### **Building a Dockerfile and giving it a name**
<code>docker build -f Dockerfile -t framaxwlad/jenkins_bazel .</code>

### **Running the created Docker**
<code>docker container run -p 8080:8080 -p 50000:50000 framaxwlad/jenkins_bazel</code>

Use the flag <code>-d --restart unless-stopped</code> after <code>run</code> to restart the docker everytime until stopped manually.

<code>docker container run -d --rm --name jenkins_test -p 8080:8080 -p 5000:5000 -v /home/fra/jenkins_docker:/var/lib/jenkins framaxwlad/jenkins_bazel</code>

---

_Dockerfile validated with:_

<url>https://www.fromlatest.io/#/</url>


_Useful links:_

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
