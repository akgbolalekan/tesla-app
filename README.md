HOW TO BUILD AND RUN THE CONTAINER LOCALLY
  Git clone the repository into your local server
    - git clone https://github.com/akgbolalekan/tesla-app.git

  Build the application locally using maven to create a .war file
    - mvn clean package

  Build an image using the Dockerfile
    - docker build -t <image-name>

  Run the Container
    - docker run -d -p 8090:8080 --name <name-of-container> <image-name>
  Access the application
    - http://localhost:8090/wfapp

HOW TO DEPLOY THE APPLICATION TO AWS EC2

 AWS Setup

    Launch an EC2 Instance:
       -Go to the AWS EC2 Dashboard and launch a new instance using Amazon Linux 2 or Ubuntu 20.04.
       -Ensure it has enough resources to run Docker (t2.micro is sufficient for small apps).
       -Assign a Security Group that allows inbound traffic on ports:
            HTTP (Port 80)
            HTTPS (Port 443)
            Custom TCP (Port 8090) port number to be used for container

   Install Docker on EC2
      - sudo yum update -y
      - sudo amazon-linux-extras install docker
      - sudo service docker start
      - sudo systemctl enable docker
      - sudo usermod -a -G docker ec2-user
      - sudo systemctl restart docker

   Create a directory in the EC2 Instance.
      - mkdir <name of the directory>

   Clone the repository
      - git clone https://github.com/akgbolalekan/tesla-app.git

   Build the application locally using maven to create a .war file
      - mvn clean package

   Build an image using the Dockerfile
      - docker build -t <image-name>

   Run the Container
      - docker run -d -p 8090:8080 --name <name-of-container> <image-name>

   Access the application
    - http://<IP Address>:8090/wfapp


HOW TO SET UP HTTPS FOR THE APPLICATION

   Install Certbot for Let's Encrypt SSL certificate installation:
      - sudo yum install -y certbot python2-certbot-nginx

   Obtain an SSL certificate for your domain:
      - sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
