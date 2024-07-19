# Robot-demo
Welcome to my Robot Framework demo repository.
[Robot Framework](https://robotframework.org/) is an open source automation framework
Here I introduce some basic tests for
* API
* Web

Tests cover building custom library (that is extended [Browser](https://robotframework-browser.org/)), BDD Test Cases, Data-Driven Test Cases.

# Docker
Repository contains Dockerfile which can be used.
To use docker:
* make sure Docker is installed
* run ``./docker_demo.sh delete-after`` script to ``create image``, ``run tests`` and ``delete image after``
* run ``./docker_demo.sh`` script to ``create image`` and ``run tests`` in the docker without deleting image

Please note that it will take some time to create a Docker image

# Environment Setup
* Install Node.js (LTS version)
* Install python3.12.* +
* Ensure that both Node.js and Python are in the ``PATH`` environment variable
* install packages from ``requirements.txt``: ``pip install -r requirements``
* initialize Browser ``python3 -m Browser.entry init``

