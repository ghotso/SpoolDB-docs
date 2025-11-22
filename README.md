# Website

This website is built using [Docusaurus](https://docusaurus.io/), a modern static website generator.

## Installation

```bash
npm install
```

## Local Development

```bash
npm start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

## Build

```bash
npm run build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

## Docker Deployment

### Building the Docker Image

```bash
docker build -t spooldb-docs .
```

### Running the Container

```bash
docker run -p 80:80 spooldb-docs
```

The documentation site will be available at `http://localhost`.

### GitHub Container Registry (GHCR)

The project includes a GitHub Actions workflow that automatically builds and pushes Docker images to GitHub Container Registry on pushes to the `main` branch.

The image will be available at:
```
ghcr.io/<repository-owner>/spooldb-docs:latest
```

To pull and run the image:
```bash
docker pull ghcr.io/<repository-owner>/spooldb-docs:latest
docker run -p 80:80 ghcr.io/<repository-owner>/spooldb-docs:latest
```

**Note:** Replace `<repository-owner>` with your GitHub username or organization name. The workflow automatically uses `${{ github.repository_owner }}` which resolves to the repository owner.

## Deployment

Using SSH:

```bash
USE_SSH=true npm run deploy
```

Not using SSH:

```bash
GIT_USER=<Your GitHub username> npm run deploy
```

If you are using GitHub pages for hosting, this command is a convenient way to build the website and push to the `gh-pages` branch.
