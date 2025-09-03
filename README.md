# Salesforce build package from git log

## Sumary
* [Purpose](#purpose)
* [Prepare folder](#prepare-folder)
* [Usage](#usage)
* [Files](#files)
* [Contribution](#Contribution)

## Purpose
Generate build "package" from a list of commits in git and deploy it on PRD and Training.

```
!IMPORTANT Remember to update this script to path that is your SFDX repo, due to correct structure to be managed
```

## Prepare folder
1. Create a folder named workspace_bash
2. Run the comand `git init`
3. Run the comand `git clone ...`
4. Open the folder created on git clone
5. Paste the path `bash`

## Usage   
1. Add full hash in 'baseline.txt' (just 1st line);  
2. Run `bash deploy.sh`;  
3. Script will create "unpackaged" folder with a new SFDX project structure with commited files inside it and a pckage.xml file.

## Results
At the end you will recieve a path with all files that were inside each commit since you baseline configured and a package.xml file: 
![image](https://user-images.githubusercontent.com/15347353/137984457-d3f31da5-8adb-4f0d-9c90-5f3275177a83.png)

Files managed: 
1. baseline.txt: Hash that could be your baseline;
2. lista_arquivos_modificados.txt: List of updated files inside each hash listed in 'commitlist.txt';
3. commitlist.txt: list of commit existed in log repo since hash baseline.

## Contribution
If you want to contribute, please read more about markdown tags to edit README file, [Markdown guide](https://docs.microsoft.com/en-us/vsts/project/wiki/markdown-guidance?view=vsts)
