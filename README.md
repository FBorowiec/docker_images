# Docker Images

### **Building a Dockerfile and giving it a name**
```
docker build -f Dockerfile -t framaxwlad/jenkins_bazel .
```

### **Running the created Docker**

* Use the flag <code>--restart unless-stopped </code> to restart the docker everytime until stopped manually.
* Use the flag <code>--rm </code> to remove the container after stopping

Prior to executing the container:
```
sudo chmod 747 /home/${HOME}/jenkins_docker

docker container run -d --restart unless-stopped --name jenkins_ci -p 8080:8080 -p 5000:5000 -v /home/${HOME}/jenkins_docker:/var/lib/jenkins framaxwlad/jenkins_bazel
```

---

_Dockerfile validated with:_

<url>https://www.fromlatest.io/#/</url>


_Useful links:_

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
