![Maintainer](https://img.shields.io/badge/Maintained%20By-Anvaya%20Cloud-brightgreen) [![Trivy GitHub Action Workflow](https://github.com/anvayacloud/trivy-action/actions/workflows/main.yaml/badge.svg)](https://github.com/anvayacloud/trivy-action/actions/workflows/main.yaml) [![Create Release](https://github.com/anvayacloud/trivy-action/actions/workflows/release.yaml/badge.svg)](https://github.com/anvayacloud/trivy-action/actions/workflows/release.yaml)

# Introduction

As we know a software vulnerability is a flaw or weakness present in the software or operating system and therefore as a best practice we should have a solution at place to scan the docker images for vulnerability issues. This GitHub is going to utilize an Aquasec Trivy (tri pronounced like trigger, vy pronounced like envy) to achieve this. 

Trivy detects vulnerabilities of OS packages (Alpine, RHEL, CentOS, etc.) and application dependencies (Bundler, Composer, npm, yarn etc.). Trivy is easy to use. Just install the binary and you're ready to scan. All you need to do for scanning is to specify an image name of container.

This GitHub action helps DevOps, Cloud & Dev teams to integrate Trivy in their CI workflow to scan the local container images prior to pushing them to registry.

## Example

```yaml
name: GitHub Workflow
on:
  push:
    branches:
      - main
jobs:
  trivy-scan:
    name: trivy-scan
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run Trivy
      uses: anvayacloud/trivy-action@main
```

This action supports the following inputs:

|       Inputs         |                  Description                                   |   Required  |   Default Value  |
|----------------------|----------------------------------------------------------------|-------------|------------------|
|  image_name          | contains the image name to scan                                |     yes     |       -          |
|  severity            | contains the severity type e.g. HIGH, MEDIUM                   |     no      |  HIGH, CRITICAL  |
|  format              | contains the output format e.g. table or json                  |     no      |      table       |
|  vuln_type           | contains the type of vulnerability you want to scan            |     no      |   os,library     |
|  exit_code           | contains trivy command exit code in case vulnerability found   |     no      |       128        |

```yaml
name: GitHub Workflow
on:
  push:
    branches:
      - main
jobs:
  trivy-scan:
    name: trivy-scan
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run Trivy
      uses: anvayacloud/trivy-action@v0.0.2
      with:
        image_name: nginx
        format: "json"
```

## Contributing
We would love you to contribute to `@anvayacloud/trivy-action`, pull requests are welcome! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) for more information.

## License
The scripts and documentation in this project are released under the [MIT License](LICENSE)
