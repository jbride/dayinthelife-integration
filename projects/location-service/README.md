# Spring-Boot Camel QuickStart

This example demonstrates how you can use Apache Camel with Spring Boot.

The quickstart uses Spring Boot to configure a little application that includes a Camel route that triggers a message every 5th second, and routes the message to a log.

## Reference

1. [Getting Started With Fuse on Spring Boot](https://access.redhat.com/documentation/en-us/red_hat_fuse/7.9/html-single/getting_started_with_fuse_on_spring_boot/index)

## Creation

A Fuse on SpringBoot seed project can be generated from either the *Launcher* or via a maven archetype:

1. https://developers.redhat.com/launch :
   ![launcher](docs/fuse_launcher.png)

## Building

The example can be built with

    mvn clean install

## Running the example in docker-compose

1. Start-up:

    $ docker-compose -f etc/docker-compose.yaml up -d

1.  View pods:

    $ podman ps -a

1.  Get all locations:

    $ curl -v localhost:8080/locations | jq .

1. Shut-down:

    $ docker-compose -f etc/docker-compose.yaml down


## Deploy Application in OCP using Ansible

1. $ cd ansible

1. install:

    $ ansible-playbook playbooks/install.yml

1. uninstall:

    $ ansible-playbook playbooks/install.yml -e ACTION=uninstall

## OLD
### Running the example in OpenShift using Fabric 8 maven plugin

It is assumed that:
- OpenShift platform is already running, if not you can find details how to [Install OpenShift at your site](https://docs.openshift.com/container-platform/3.3/install_config/index.html).
- Your system is configured for Fabric8 Maven Workflow, if not you can find a [Get Started Guide](https://access.redhat.com/documentation/en/red-hat-jboss-middleware-for-openshift/3/single/red-hat-jboss-fuse-integration-services-20-for-openshift/)

The example can be built and run on OpenShift using a single goal:

    mvn fabric8:deploy

When the example runs in OpenShift, you can use the OpenShift client tool to inspect the status

To list all the running pods:

    oc get pods

Then find the name of the pod that runs this quickstart, and output the logs from the running pods with:

    oc logs <name of pod>

You can also use the OpenShift [web console](https://docs.openshift.com/container-platform/3.3/getting_started/developers_console.html#developers-console-video) to manage the
running pods, and view logs and much more.

### Running via an S2I Application Template

Application templates allow you deploy applications to OpenShift by filling out a form in the OpenShift console that allows you to adjust deployment parameters.  This template uses an S2I source build so that it handle building and deploying the application for you.

First, import the Fuse image streams:

    oc create -f https://raw.githubusercontent.com/jboss-fuse/application-templates/GA/fis-image-streams.json

Then create the quickstart template:

    oc create -f https://raw.githubusercontent.com/jboss-fuse/application-templates/GA/quickstarts/spring-boot-camel-template.json

Now when you use "Add to Project" button in the OpenShift console, you should see a template for this quickstart. 

