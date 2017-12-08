---
layout: post
title:  From `sync2.php` to Continuous Delivery
date:   2017-06-09
category: technology
---

*We have our semi-weekly presentations about various IT topics. This is the first one by Maciej Łebkowski about deployment tools and strategies. Slides are [available on github](https://github.com/syzygypl/it-speak-up/tree/master/2017-06-09%20-%20puck%20-%20deployment)*

---

Our deployment strategies are all over the board. Once there was a `sync2.php` script on the production server, ;) some other time it was a git pull & make combo, and in some other case it was an opsworsk app with chef scripts. But we’re no longer medieval and we try to build [12 factor](https://12factor.net) applications.

There are a couple of requirements we like our applications to meet:

 * The whole process from commit to production needs to be automated
 * The process should consist of a test step, build step, deploy step and a release step
 * One commit has exactly one build, and this build can be deployed to any environment (production, staging, qa)
 * The build should resemble a binary and require as little outside dependencies as possible

It looks like your goals are similar to ours, so let’s dive into details.

### What is each step?

The whole process is a continuous delivery approach.

 1. It starts with a commit. Each commit is deployable, but not necessarily to production. Either way a build needs to be done. To do this you need to connect your VCS repository (via a webhook or otherwise) to a test/build environment. After the test suite passes, the application is built and stored.

 2. After a successful build, the process goes to a deployment step. Depending on some factors (the branch the commit was pushed to for an instance), the deployment may or may not run, and it may target different environments. This way your master branch may deploy to production, the develop branch to a staging env and each branch starting with feature/ goes to a separate QA env.

 3. The deployment step only ensures that the latest version of the application is available on target nodes. The last thing left to do is to switch to that version, and it’s called the release. There are some strategies you can use to reduce downtime and have the ability to rollback — you’re familiar with capistrano so you probably know them — it keeps a bunch of recent releases on disk and only switches the current symlink.

### Build tools

First of all, look at heroku. It has a build script called buildpacks. They have some common interface to build any PHP app, including specific actions for popular frameworks. In your case you could require phing in your composer file and add the build script to the `post-install-cmd`. You can even stack buildpacks together so that you first use a nodejs buildpack and run `npm` & `bower` & `gulp` and whatnot, then build the PHP app using `composer` & `phing`. After a little learning it really covers 98/100 cases (in my experience).

But you of course don’t wan’t to lock-in to a specific platform. Don’t worry, since this mechanism is used in many other, open source tools. `dokku` for instance uses a buildpack-ish script. This has an added benefit, since it compiles a docker image. This way the build is highly portable, needs no dependencies other than docker itself and may contain not only the code, but also the runtime (like apache & php-fpm with modules) and some basic configuration (env vars, php.ini, .htaccess, etc).

I’ll give you some examples. For your build server you can use anything comes up in google for a continuous integration query. Popular ones are [Jenkins][] (self hosted), [CodeShip][], [Travis][]. I guess they all have a distinct test and build steps, or even a custom pipeline. It’s better to use a popular one (even if it costs slightly more) because of the community and integrations. You are not the first one that needs to build their PHP application, so there is no need to reinvent the wheel here. There are a lot of out-of-the-box plugins — for instance to integrate automatically with github, gitlab or bitbucket and report build status.

If you’re not into docker and rather have a zip file, it’s common practice to pack all the build artifacts (i.e. compiled application) and push to a S3 bucket. Again, there are probably tools you can use for that instead of writing your own. I like to use [Wercker][], since it uses docker for build environment, has a large community and enables you to create multiple build pipelines. This is a sample wercker configuration from one of our apps using herokuish to create the docker image and then to push it to the docker registry (so it can be pulled/deployed).

### Deployment tools

Capistrano with some plugins is just fine for deployments. It doesn’t need to build the app if you done this on the build server. All it needs to do is to rsync the package to all servers. Or tell them to fetch it from S3 / docker hub / wherever. I don’t have much experience with capistrano, but I assume that it may be complicated to use it in a distributed environments.

If you’re using docker (yep, I’m a fan), you can use the [Docker Cloud service][] to deploy. I even created a [wercker step to make a blue-green type of deployment][blue-green] using docker cloud. It warms up new application containers, scales them up, then switches the load balancer to them and then scale down the previous version. As far as I know docker cloud can be replaced for [Kubernetes, and here is a simple introduction][kube]. Both those solutions run on distributed systems and use a service discovery to tie the application back together.

Another important thing is a GUI. It’s nice to have a "deploy" button. You have a continuous delivery (every commit is deployed automatically), but maybe something goes wrong? Or you’d like to check the progress of the deployment. Or make a rollback. Or create a new (non-automated) environment… Docker Cloud helps a little with that, but generally I don’t have a great solution for that yet.

### Final words

The one thing I learned from all the years of deploying applications is to use existing tools and concepts in an automated manner. If you stray from this path you end up with a weird legacy system, not portable to other applications. The build server always builds any app the same way (run composer install for example) and the build details are in the application code (phing.xml or composer scripts, etc); Similarly the deploy server knows how to launch a package (just run a docker image and forward a port), and the build contains the runtime details (is it a nginx, a node script, a go binary…).

# Notes

 * Commit hooks are a starting point to everything
 * Everything needs to be automated and auditable

## Build Tools

 * Heroku
 * [Herokuish](https://github.com/gliderlabs/herokuish)
 * Chef / Ansible
 * Bash / Makefile
 * Dockerfile

## Build storage

 * Docker hub
 * S3

## Test tools

 * phpunit
 * CodeShip
 * Wercker
 * GhostInspector
 * Application Health Checks

## Deployment tools

 * OpsWorks, Beanstalk
 * Docker pull
 * Capistrano
 * rsync

## Release tools

 * Docker env files
 * Opsworks parameters
 * Heroku settings



 [Jenkins]: https://jenkins.io/
 [CodeShip]: https://codeship.com/
 [Travis]: https://travis-ci.org/
 [Wercker]: https://www.wercker.com/
 [Docker Cloud service]: (cloud.docker.com)
 [blue-green]: https://github.com/mlebkowski/wercker-step-bluegreen
 [kube]: https://www.youtube.com/watch?v=pozC9rBvAIs
