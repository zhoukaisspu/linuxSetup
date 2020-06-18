# Brief

Setup the linux environment automatically.

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

### Install list

| script name   |    responsibility   |
|---------------|---------------------|
| `tmuxSetup.sh` | Add color configuration for tmux |
| `jreSetup.sh` | Install openjdk-8-jdk and openjdk-8-jre  |
| `devToolsSetup.sh`  | Install git, vim, tmux|
| `jenkinsSetup.sh`  | Add key add jenkins.list for apt, also intall jenkins | 

### Job list

| script name   |  responsibility   |
|---------------|-------------------|
| `cppscanSetup.sh` | set up "cppscan" job |
