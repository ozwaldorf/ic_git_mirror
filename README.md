![image](https://user-images.githubusercontent.com/8976745/188801429-a737c73f-3449-479a-be1e-ceb4860e3540.png)

# ic_git_mirror

Mirror git repos onto IC asset cansiters! The asset canister will become a self contained git host, providing read only copies of the repositories.

## Mainnet example

[https://34a4i-5iaaa-aaaah-abqwq-cai.raw.ic0.app/](https://34a4i-5iaaa-aaaah-abqwq-cai.raw.ic0.app/)

> Any git client that supports dumb-http can clone a repo from an asset canister host (in raw mode).

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