# SourceGuard-Example
Written by Michael Braun

This document outlines how to implement SourceGuard (beta) into a Github Actions pipeline.

This was written based off of the guide from Dean Houari. Check out his writeup for [Jenkins-SourceGuard](https://github.com/chkp-dhouari/Jenkins-SourceGuard)

## Prerequisites
[Github Account](https://github.com) <br>
[Check Point Infinty Portal](https://portal.checkpoint.com) <br>

### DevSecOpps Workflow
![](/images/cicd.png)


This tool has the ability to scan your code prior to building and scan the container image after building. It is very simple to implement. Once you have your sourceguard-cli file and SourceGuard API keys, it is just a matter of adding the following code into Github Actions:

```bash
- name: SourceGuard Code Scan
      run: |
            chmod +x sourceguard-cli 
            ./sourceguard-cli --src .
```

```bash
 - name: SourceGuard Container Image Scan
      run: |
            chmod +x sourceguard-cli 
            ./sourceguard-cli --img ./vulnerablewebapp.tar
```

Note: Large container images may require a longer time out. For the full procedure, please review the [manual.yml](https://github.com/metalstormbass/SourceGuard-Example/blob/master/.github/workflows/manual.yml) file.