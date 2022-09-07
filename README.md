# ic_git_mirror

Mirror git repos onto IC asset cansiters!

## Mainnet example

```bash
git clone https://34a4i-5iaaa-aaaah-abqwq-cai.raw.ic0.app/ic_otp.git
```

```bash
git clone https://34a4i-5iaaa-aaaah-abqwq-cai.raw.ic0.app/ic-playground.git
```

## Using the project

### Building the "dumb-http" repositories

This will clone bare and build server info for the repositories specified in the `REPOS` enviroment variable, or the defaults included in the make file.

```bash
make repos
```

### Deploying locally

> Deploying will automatically build the repos beforehand

```bash
make local
```

### Deploying to ic

> Deploying will automatically build the repos beforehand


```bash
make ic
```

### Cloning your mirrored repositories

At this point, you should be able to clone the repos with any git client like so:

```bash
git clone http://rrkah-fqaaa-aaaaa-aaaaq-cai.localhost:8000/ic_otp.git
```
```bash
git clone http://rrkah-fqaaa-aaaaa-aaaaq-cai.localhost:8000/ic-playground.git
```

> Note: although untested, you should be able to clone repos from `canister.raw.ic0.app` for mainnet deployments