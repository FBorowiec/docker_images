# **Dockerfile**

## **Building a Dockerfile**

`-t` tags the image to the given name. This image contains the *Bazel* build system as well as *Jenkins* as to experiment with *Jenkins* functionalities with projects that can be build with *Bazel*.

```bash
docker build -f Dockerfile -t framaxwlad/jenkins_bazel .
```

### **Running a container of the created Docker image**

* Use the flag `--restart unless-stopped` to restart the docker everytime until stopped manually.
* Use the flag `--rm` to remove the container after stopping.

Prior to executing the container for the first time, chose a folder wher to store the persistent data of the CI:

```bash
mkdir ~/jenkins_docker
docker container run -d --rm --name jenkins_ci -p 8080:8080 -p 5000:5000 -v ~/jenkins_docker:/var/lib/jenkins framaxwlad/jenkins_bazel
```

## Docker-compose

### **Setting-up a docker composition**

```bash
docker-compose up
```

---

_Dockerfile validated with:_

[https://www.fromlatest.io/#/](https://www.fromlatest.io/#/)

_Useful links:_
* [https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)

* [https://warlord0blog.wordpress.com/2020/02/23/docker-and-openvpn/](https://warlord0blog.wordpress.com/2020/02/23/docker-and-openvpn/)

#### **Future work**

Instead of having to create a separate folder and attaching it to the container via `-v ~/jenkins_docker:/var/lib/jenkins`,
I want to be able to mount it directly to a volume created via the docker volume create command:

```bash
docker volume create --name=jenkins_docker
sudo chown 1000:1000 /var/lib/docker/volumes/jenkins_docker -R
docker container run -d --rm --name jenkins_ci -p 8080:8080 -p 5000:5000 -v jenkins_docker:/var/lib/jenkins framaxwlad/jenkins_bazel
```

Where `1000` is the user's ID.
