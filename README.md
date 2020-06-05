# Docker Images

### **Building a Dockerfile and giving it a name**
<code>sudo docker build -f Dockerfile -t framaxwlad/jenkins_bazel .</code>

### **Running the created Docker**
<code>docker run -p 8080:8080 -p 50000:50000 -v /home/\${USER}/\${CHOSEN_FOLDER}:/var/jenkins_home framaxwlad/jenkins_bazel</code>

---

_Jenkins validated with:_

<url>https://www.fromlatest.io/#/</url>


_Useful links:_

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
