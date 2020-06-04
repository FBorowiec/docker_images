# Docker Images

sudo docker build -f Dockerfile -t framaxwlad/jenkins_bazel .

docker run -p 8080:8080 -p 50000:50000 -v /home/${USER}/${CHOSEN_FOLDER}:/var/jenkins_home framaxwlad/jenkins_bazel