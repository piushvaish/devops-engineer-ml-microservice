<include a CircleCI status badge, here>

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). 

This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. 

In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---
### Project Structure
This project includes most of the necessary files for submission.

You will need to create a .circleci directory and config.yml file therein, but any other files will just need to be modified and completed.

You are expected to submit a complete project via a link to a Github repository; if this is your first time using Github, it may be helpful to take a look at our free course on using Github for version control.

#### Cloning a Repository
To clone this repository from a command line or terminal, you should navigate to a directory where you want to save this repository (I often use my Desktop) and then copy-paste this command:

git clone https://github.com/udacity/DevOps_Microservices.git
Then navigate to the downloaded project directory using two more commands, in order:

* cd DevOps_Microservices
* cd project-ml-microservice-kubernetes

This should get you into the main working project directory that has all the starter files. You can test that you are in the correct directory by seeing if you can access one of the project files from the command line. You can type cat Makefile to see the starting Makefile in the project directory, for example.

#### CircleCI
Again, most of the project files are included as complete files or as files that you need to change and complete. The only file and directory you'll need to add will be when you create your own Github project repository.

When you have your own repository, you will be required to add your own CircleCI directory to your repository. The yaml file that tests your code can be downloaded by clicking this link. You can upload this directly to your repository or copy-paste the tests that are in it.
## Setup the Environment

### Create an ec2 Linux ec2 instance

#### Step 1: Launch an instance
You can launch a Linux instance using the AWS Management Console as described in the following procedure. This tutorial is intended to help you launch your first instance quickly, so it doesn't cover all possible options. For more information about the advanced options, see Launching an Instance.

##### To launch an instance

Open the [Amazon EC2 console](https://console.aws.amazon.com/ec2/)

From the console dashboard, choose Launch Instance.

The Choose an Amazon Machine Image (AMI) page displays a list of basic configurations, called Amazon Machine Images (AMIs), that serve as templates for your instance. 

Select an HVM version of Amazon Linux 2. Notice that these AMIs are marked "Free tier eligible."

On the Choose an Instance Type page, you can select the hardware configuration of your instance. Select the t2.micro type, which is selected by default. Notice that this instance type is eligible for the free tier.

Choose Review and Launch to let the wizard complete the other configuration settings for you.

On the Review Instance Launch page, under Security Groups, you'll see that the wizard created and selected a security group for you. You can use this security group, or alternatively you can select the security group that you created when getting set up using the following steps:

Choose Edit security groups.

On the Configure Security Group page, ensure that Select an existing security group is selected.

Select your security group from the list of existing security groups, and then choose Review and Launch.

On the Review Instance Launch page, choose Launch.

When prompted for a key pair, select Choose an existing key pair, then select the key pair that you created when getting set up.

Alternatively, you can create a new key pair. Select Create a new key pair, enter a name for the key pair, and then choose Download Key Pair. This is the only chance for you to save the private key file, so be sure to download it. Save the private key file in a safe place. You'll need to provide the name of your key pair when you launch an instance and the corresponding private key each time you connect to the instance.

Warning
Don't select the Proceed without a key pair option. If you launch your instance without a key pair, then you can't connect to it.

When you are ready, select the acknowledgement check box, and then choose Launch Instances.

A confirmation page lets you know that your instance is launching. Choose View Instances to close the confirmation page and return to the console.

On the Instances screen, you can view the status of the launch. It takes a short time for an instance to launch. When you launch an instance, its initial state is pending. After the instance starts, its state changes to running and it receives a public DNS name. (If the Public DNS (IPv4) column is hidden, choose Show/Hide Columns (the gear-shaped icon) in the top right corner of the page and then select Public DNS (IPv4).)

It can take a few minutes for the instance to be ready so that you can connect to it. Check that your instance has passed its status checks; you can view this information in the Status Checks column.

##### Step 2: Connect to your instance
There are several ways to connect to your Linux instance. For more information, see Connect to your Linux instance.

Important
You can't connect to your instance unless you launched it with a key pair for which you have the .pem file and you launched it with a security group that allows SSH access from your computer. If you can't connect to your instance, see Troubleshooting connecting to your instance for assistance.

###### Step 3: Clean up your instance
After you've finished with the instance that you created for this tutorial, you should clean up by terminating the instance. If you want to do more with this instance before you clean up, see Next steps.

Important
Terminating an instance effectively deletes it; you can't reconnect to an instance after you've terminated it.

If you launched an instance that is not within the AWS Free Tier, you'll stop incurring charges for that instance as soon as the instance status changes to shutting down or terminated. If you'd like to keep your instance for later, but not incur charges, you can stop the instance now and then start it again later. For more information, see Stopping Instances.

To terminate your instance

In the navigation pane, choose Instances. In the list of instances, select the instance.

Choose Actions, Instance State, Terminate.

Choose Yes, Terminate when prompted for confirmation.

Amazon EC2 shuts down and terminates your instance. After your instance is terminated, it remains visible on the console for a short while, and then the entry is deleted.


##### Creating an environment
[Create (and activate) a new environment](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-linux-python3-boto3/), named .devops with Python 3. 
If prompted to proceed with the install (Proceed [y]/n) type y.

`python3 -m venv ~/.devops`

`source ~/.devops/bin/activate`

At this point your command line should look something like: (.devops) 
<User>:project-ml-microservice-kubernetes<user>$. The (.devops) indicates that your environment has been activated, and you can proceed with further package installations.

Installing dependencies via project Makefile. Many of the project dependencies are listed in the file requirements.txt; these can be installed using pip commands in the provided Makefile. While in your project directory, type the following command to install these dependencies.
make install
Now most of the .devops libraries are available to you. There are a couple of other libraries that we'll be using, which can be downloaded as specified, below.

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

## Other Libraries
While you still have your .devops environment activated, you will still need to install:

### Docker

Update the installed packages and package cache on your instance.

`sudo yum update -y`

Install the most recent Docker Community Edition package.

`sudo amazon-linux-extras install docker`

Start the Docker service.

`sudo service docker start`

Add the ec2-user to the docker group so you can execute Docker commands without using sudo.

`sudo usermod -a -G docker ec2-user`

Log out and log back in again to pick up the new docker group permissions. You can accomplish this by closing your current SSH terminal window and reconnecting to your instance in a new one. Your new SSH session will have the appropriate docker group permissions.

Verify that the ec2-user can run Docker commands without sudo.

`docker info`

### Hadolint
As shown before, hadolint is available as a Docker container:

`docker pull hadolint/hadolint`

Docker comes to the rescue to provide an easy way how to run hadolint on most platforms. Just pipe your Dockerfile to docker run:

`docker run --rm -i hadolint/hadolint < Dockerfile`

### Kubernetes (Minikube)
Here is how I installed minikube:

[Reference](https://www.radishlogic.com/kubernetes/running-minikube-in-aws-ec2-ubuntu/)

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`


## Project Tasks
Assuming you have a terminal window open, you’re in the project directory, and your .devops environment is activated, you can continue viewing and editing project files!

This section is quite dense and so, it is suggested that you approach one task at a time, carefully reading through the instructions and completing the task, then taking a break if you desire, and coming back to the next task.

### Task 1: Complete the Dockerfile
Docker can build images automatically by reading the instructions from a Dockerfile. The Dockerfile contains all the commands a user could call on the command line to assemble an image.

To view the contents of the Dockerfile type: cat Dockerfile. You can edit any file by opening it in a text editor and saving it.

#### Dockerfile
You can see that you have been given a couple of lines of code in the Dockerfile and some instructions.

* FROM is provided for you; the FROM instruction initializes a new build stage and sets the base image for subsequent instructions. In this case, it specifies Python3 as the base image for this application. The rest of the Dockerfile instructions are left for you to complete. You should have instructions that:

* Specify a working directory.
Copy the app.py source code to that directory
Install any dependencies in requirements.txt (do not delete the commented # hadolint ignore statement).
* Expose a port when the container is created; port 80 is standard.
* Specify that the app runs at container launch.
After you complete this file and save it, it is recommended that you go back to your terminal and run make lint again to see if hadolint catches any errors in your Dockerfile. You are required to pass these lint checks to pass the project.

### Task 2: Run a Container & Make a Prediction
In order to run a containerized application, you’ll need to build and run the docker image that you defined in the Dockerfile, and then you should be able to test your application, locally, by having the containerized application accept some input data and produce a prediction about housing prices. run_docker.sh

Next, open and complete the file, run_docker.sh to be able to get Docker running, locally.

Within run_docker.sh, complete the following steps:

Build the docker image from the Dockerfile; it is recommended that you use an optional --tag parameter as described in the build documentation.
List the created docker images (for logging purposes).

Run the containerized Flask app; publish the container’s port to a host port. The appropriate container and host ports are in the Dockerfile and make_prediction.sh files, respectively.
You can find a list of all the docker commands you might need to use in the documentation.

##### Running the complete script
This file is a shell script which you can see from the extension .sh. To run a shell script in ec2 linux environment , you type sh <scriptname>.

To run and build a docker image, you’ll type 

`sh run_docker.sh`

 After typing this command, you should see something like the following in your terminal, followed by a number of build steps:

run docker script
After a brief waiting period, you should see messages indicating a successful build, along with some indications that your app is being served on port 80 (also, a warning about the development server is to be expected, here).

Successfully built <build id>
Successfully tagged <your tag>
This indicates a successful build and if you keep this application running you can make predictions!

##### Reference:
http://containertutorials.com/index.html


##### Making predictions
Then, to make a prediction, you have to open a separate tab or terminal window. In this new window, navigate to the main project directory (some computers will do this automatically) and call 

`sh make_prediction.sh`

This shell script is responsible for sending some input data to your containerized application via the appropriate port. Each numerical value in here represents some feature that is important for determining the price of a house in Boston. The source code is responsible for passing that data through a trained, machine learning model, and giving back a predicted value for the house price.

In the prediction window, you should see the value of the prediction, and in your main window, where it indicates that your application is running, you should see some log statements print out. You’ll see that it prints out the input payload at multiple steps; when it is JSON and when it’s been converted to a DataFrame and about to be scaled.

After making a prediction, you can type CTRL+C (+enter) to quit running your application. 
You can always re-run it with a call to 

`sh run_docker.sh`

Your next task will be to add a log statement in app.py that prints out the pre-trained model prediction as Log.info.

The complete text output from these logs will be submitted as part of the complete project.

### Task 3: Improve Logging & Save Output
Logging is an important part of debugging and understandability. Many times, logs will be how engineers figure out what an app is doing as it processes some input. In this case, app.py is responsible for

Accepting an input JSON payload, and converting that into a DataFrame.
Scaling the DataFrame payload.
Passing the scaled data to a pre-trained model and getting back a prediction.
So far, the logs print out the JSON and DataFrame payloads, but do not have any statements for the scaled input or the resultant prediction. The prediction is an especially important piece of information and so you definitely want that value in the logs.

Add a prediction log statement
Your task is to add at least one log statement to app.py that prints out the output prediction values. You can add more log statements than that, but that is what is required.

Once you have updated your app.py code, save it and
 `sh run_docker.sh`

 again and make the same prediction in a separate terminal window.

Create docker_out.txt
Copy and paste this terminal output, which has log info, in a text file docker_out.txt. A sample output is shown below.


Sample log output

The docker_out.txt file should include all your log statements plus a line that reads something like ”POST /predict HTTP/1.1” 200 - The 200 is a standard value indicating the good “health” of an interaction. The docker_out.txt file will be one of two, log output files that will be part of a passing, project submission.

Again, after making a prediction, you can type CTRL+C (+enter) to quit running your application. You’ll need to quit running before you can move on to the next steps and upload the built, docker image.

### Task 4: Upload the Docker Image
Now that you’ve tested your containerized image locally, you’ll want to upload your built image to docker. This will make it accessible to a Kubernets cluster.

Upload your Docker image
To upload an image to docker, you’ll need to complete the upload_docker.sh file:

Define a dockerpath which will be “/path”; the path may be the same as the build tag you created in run_docker.sh or just some descriptive path name. Recall that your docker username is your unique docker ID.
Authenticate and tag image; this step is responsible for creating a login step and ensuring that the uploaded docker image is tagged descriptively.
Similar to how you might push a change to a Github repository, push your docker image to the dockerpath defined in step 1. This push may take a moment to complete.
Assuming you’ve already built the docker image with `sh run_docker.sh`, you can now upload the image by calling the complete shell script 

` sh upload_docker.sh` 

If you’ve successfully implemented authentication and tagging, you should see a successful login statement and a repository name that you specified, printed in your terminal. You should also be able to see your image as a repository in your docker hub account.

[Docker hub](https://hub.docker.com/repository/docker/piushvaish/mlapp/general)


### Task 5: Configure Kubernetes to Run Locally
You should have a virtual machine like VirtualBox and minikube installed, as per the project environmet instructions. To start a local cluster, type the terminal command: minikube start.

After minikube starts, a cluster should be running locally. You can check that you have one cluster running by typing kubectl config view where you should see at least one cluster with a certificate-authority and server.

This is a short task, but it may take some time to configure Kubernetes, and so this deserves its own task number.

### Task 6: Deploy with Kubernetes and Save Output Logs
Now that you’ve uploaded a docker image and configured Kubernetes so that a cluster is running, you’ll be able to deploy your application on the Kubernetes cluster. This involves running your containerized application using kubectl, which is a command line interface for interacting with Kubernetes clusters.

`sh run_kubernetes.sh`

To deploy this application using kubectl, open and complete the file, run_kubernetes.sh:

The steps will be somewhat similar to what you did in both run_docker.sh and upload_docker.sh but specific to kubernetes clusters. Within run_kubernetes.sh, complete the following steps:

Define a dockerpath which will be “/path”, this should be the same name as your uploaded repository (the same as in upload_docker.sh)
Run the docker container with kubectl; you’ll have to specify the container and the port
List the kubernetes pods
Forward the container port to a host port, using the same ports as before

After completing the code, call the script `sh run_kubernetes.sh`.

 This assumes you have a local cluster configured and running. This script should create a pod with a name you specify and you may get an initial output that looks as follows, with a cluster and status:

Pending pod

Initially, your pod may be in the process of being created, as indicated by STATUS: ContainerCreating, but you just have to wait a few minutes until the pod is ready, then you can run the script again.

Waiting: You can check on your pod’s status with a call to kubectl get pod and you should see the status change to Running. Then you can run the full ./run_kuberenets.sh script again.

Make a prediction
After you’ve called run_kubernetes.sh, and a pod is up and running, make a prediction using a separate terminal tab, and a call to ./make_prediction.sh, as you did before.

kubernetes.out.txt
After running a prediction via Kubernetes deployment, what do you see in your main terminal window?

Copy the text output after calling run_kubernetes.sh and paste it into a file kubernetes_out.txt. This will be the second (out of two) text files that are required for submission. This output might look quite different from docker_out.txt; this new file should include your pod’s name and status, as well as the port forwarding and handling text.

### Task 7: [Important] Delete Cluster
After you’re done deploying your containerized application and making test predictions via Kubernetes cluster, you should clean up your resources and delete the kubernetes cluster with a call to minikube delete.

You can also pause your work and save the cluster state with a call to minikube stop.

Almost Ready for Project Submission
Now, you are almost ready to submit your project!

Check that you have all complete files
Push your work to a Github repository
One last step: CircleCI Integration

### Task 8: CircleCI Integration
CircleCI is a tool that defines an automated testing environment; getting a CircleCI badge that reads "Passed" on a repository indicates that the project code has passed all lint tests. CircleCI uses a YAML file to identify how you want your testing environment set up and what tests you want to run. On CircleCI 2.0, this file must be called config.yml and must be in a hidden folder called .circleci. On Mac, Linux, and Windows systems, files and folders whose names start with a period are treated as system files that are hidden from users by default.

To create the file and folder on GitHub, click the Create new file button on the repo page and type .circleci/config.yml. You should now have in front of you a blank config.yml file in a .circleci folder.

Then you can paste the text from this yaml file into your file, and commit the change to your repository.

It may help to reference this CircleCI blog post on Github integration.

Setting up and Building a Project
To test your repository with CircleCI, you will need a CircleCI account, which you can get via their signup page + clicking "Start with GitHub." Once you have an account, you'll be able to build project using the CircleCI dashboard.

On the dashboard, you will be given the option to set up a new project. To add your new repo, ensure that your GitHub account is selected in the dropdown menu in the upper-left, find the project repository that you've created, and click the Setup project button next to it. You can leave all set up configurations as their default value then click Start building.

You should see your build start to run, and if your project passes the lint tests, you'll see that the project passes!

You can then add a status badge indicating that your project has "Passed" CircleCI tests, by looking at the markdown in the Notifications section of your project’s settings > Status Badges.
Best practice is to add the badge via markdown into the Github project's README.md file.
passed status badge

### Task 9: README.md
A complete README file should include:

A summary of the project
Instructions on how to run the Python scripts and web app (simply listing command line calls will suffice), and
A short explanation of the files in the repository.
The README should also include the "passed" status badge (shown above) at the top of the README.