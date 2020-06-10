# Dockerfile

### **Building a Dockerfile**
<code>-t </code> tags the image to the given name.
```
docker build -f Dockerfile -t framaxwlad/jenkins_bazel .
```

### **Running a container of the created Docker image**

* Use the flag <code>--restart unless-stopped </code> to restart the docker everytime until stopped manually.
* Use the flag <code>--rm </code> to remove the container after stopping.

Prior to executing the container for the first time, chose a folder wher to store the persistent data of the CI:
```
mkdir ~/jenkins_docker
docker container run -d --rm --name jenkins_ci -p 8080:8080 -p 5000:5000 -v ~/jenkins_docker:/var/lib/jenkins framaxwlad/jenkins_bazel
```

# Docker-compose

### **Setting-up a docker composition**
```
docker-compose up
```

---

_Dockerfile validated with:_

<url>https://www.fromlatest.io/#/</url>

_Useful links:_
* <url>https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04</url>
* <url>https://warlord0blog.wordpress.com/2020/02/23/docker-and-openvpn/</url>

**Issues**:
Instead of having to create a separate folder and attaching it to the container via -v ~/jenkins_docker:/var/lib/jenkins,
I want to be able to mount it directly to a volume created via the docker volume create command:

```
docker volume create --name=jenkins_docker
sudo chown 1000:1000 /var/lib/docker/volumes/jenkins_docker -R
docker container run -d --rm --name jenkins_ci -p 8080:8080 -p 5000:5000 -v jenkins_docker:/var/lib/jenkins framaxwlad/jenkins_bazel
```
Where <code>1000</code> is the user's ID.
