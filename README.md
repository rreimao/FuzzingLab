# Fuzzing Web Pages with FFuF

## Scenario
You are in a red team engagement against Globomantics, a financial conglomerate in the Gulf of Mexico. After doing some initial OSINT gathering, you discovered that their main domain is globomantics.com. 

Upon accessing the target website, you note that it contains several pages and subfolders. You also suspect that there might be few hidden folders and files, not indexed by the initial web page.

Your job is to enumerate all pages and folders from globomantics, including hidden ones. This information will help you to identify attack paths and potential exploitation entry points into the web application. 

## Technique Overview
Fuzzing a website consists in attempting several words against the URL or parameters with the intent of discovering content. 
For example, we could fuzz pages in a website by manually trying to access:
```
website.com/index.html
website.com/home.html
website.com/about.html
website.com/[…].html
```

As you might imagine, doing this process manually might take a lot of time. For this reason, researchers created FUZZING tools, which are capable of iterating through wordlists and testing websites.
In the example above, a fuzzing tool could work as follows:
```
ffuf -w [WORDLIST] -u https://website.com/FUZZ.html
```

This command would access the site website.com and test every word on the wordlist.

Note: Fuzzing generates a high volume of traffic on webservers, which might cause instabilities in legacy servers. Also, this technique might trigger Web Application Firewalls (WAF), meaning that you might be detected and blocked by the WAF solution. Only perform this technique in servers that you are authorized to attack.

## FFuF Overview
FFuF is a fuzzing tool that allows you to discover pages, folders and parameters in web applications. This tool leverages multi-threading and parallel requests to fuzz web applications with maximum performance.
```
https://github.com/ffuf/ffuf
```

## Setup
**Operating system:** Ubuntu 22.04 Desktop

**Lab architecture:** Just one stand-alone machine



### Installation Steps:
1) Create an Ubuntu 22.04 Desktop virtual machine
3) Copy the `pre-reqs.sh` file to the Desktop
2) Run the pre-reqs installer: `sudo /home/user/Desktop/pre-reqs.sh`
3) Test ffuf: `ffuf -h`


## Sample Lab Task: Enumerating Pages with FFuF

You can find one sample task here: [Task 1: Enumerating Pages with FFuF](task1.md)



## Note to Reviewers

In this audition I'm focusing on one technique only. In a real lab, I could write 5-7 tasks for FFuF. (e.g. enumerating subdomains, enumerating parameters, enumerating HOST header values, etc.)

Moreover, in this lab I'm enumerating a website on the internet just for audition purposes. In a real lab environment,  since we don't have internet access, I would create one extra machine with a web application to fuzz.
