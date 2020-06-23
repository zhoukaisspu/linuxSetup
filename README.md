# Brief

Setup the linux environment automatically.

## Prerequisite

Setup the environment variable in the `.bashrc` file.

```sh
#set up github user name
export githubUserName="zhoukaisspu"

#set up access token for user
export githubToken="Please input your token here"
```

## Run

1. Invoke the `setup.sh` to setup the environment.

```sh
$ bash ./setup.sh
```

2. Invoke the `jenkinsSetup.sh` to install *jenkins*

```sh
$ bash ./jenkinsSetup.sh
```

3. Invoke the `./jenkinsJobSetup/nativeDeploy.sh` to setup automation job.

```sh
$ bash ./jenkinsJobSetup/nativeDeploy.sh
```

### Dependency list

| script name       |    dependency list       |
|-------------------|--------------------------|
| `setup.sh`        | `devToolSetup.sh`        |
| `-->`             | `tmuxSetup.sh`            |
| `-->`             | `jreSetup.sh`             |
|===================|===========================|
| `jenkinsSetup.sh` | `It will install jenkins`   |
|===================|===========================|
| `nativeDeploy.sh` | `Deploy the automation job to /var/tmp/myJenkinsJob` |



### Install list

| script name         |    responsibility   |
|---------------------|---------------------|
| `tmuxSetup.sh`      | Add color configuration for tmux |
| `jreSetup.sh`       | Install openjdk-8-jdk and openjdk-8-jre  |
| `devToolsSetup.sh`  | Install git, vim, tmux|
| `jenkinsSetup.sh`   | Add key add jenkins.list for apt, also intall jenkins | 

### Job list

| script name   |  responsibility   |
|---------------|-------------------|
| `cppscanSetup.sh` | set up "cppscan" job |
