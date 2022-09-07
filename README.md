![image](https://user-images.githubusercontent.com/8976745/188822385-765db007-a757-4db2-9ef1-c9e93bb29f9e.png)

Mirror git repos onto IC asset cansiters! The asset canister will become a self contained git host, providing read only copies of the repositories.

With git, we can pull a bare repository definition, and update the info to be enough for a simple http server. With this, we can pack up a given repo, upload it to an asset canister, and serve the repository from the IC. This project defines a template you can deploy to the IC and upload your own dumb-http repositories.

# Mainnet example

[https://34a4i-5iaaa-aaaah-abqwq-cai.raw.ic0.app/](https://34a4i-5iaaa-aaaah-abqwq-cai.raw.ic0.app/)

> Any git client that supports dumb-http can clone a repo from an asset canister host (in raw mode).

```bash
git clone https://34a4i-5iaaa-aaaah-abqwq-cai.raw.ic0.app/ic_otp.git
```

```bash
git clone https://34a4i-5iaaa-aaaah-abqwq-cai.raw.ic0.app/ic-playground.git
```

# Using the project

## Building the "dumb-http" repositories

This will clone bare and build server info for the repositories specified in the `REPOS` enviroment variable, or the defaults included in the make file.

```bash
make repos
```

(optional) Manually override the repos to deploy:

```bash
REPOS=("https://github.com/dfinity/ic") make repos
```

> Note: You should just edit the make file for your repos

## Deploying locally

> Note: This will automatically start up the replica, if not running already.

```bash
make local
```

## Deploying to the IC

> Note: Make sure to build before hand!

```bash
make ic
```

## Cloning your mirrored repositories

At this point, you should be able to clone the locally hosted repos with any git client like so:

```bash
git clone http://rrkah-fqaaa-aaaaa-aaaaq-cai.localhost:8000/ic_otp.git
```
```bash
git clone http://rrkah-fqaaa-aaaaa-aaaaq-cai.localhost:8000/ic-playground.git
```

## Starting the development frontend

```bash
make dev
```

# License

[Licensed](LICENSE.md) under MIT