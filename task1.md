# Enumerating Pages with FFuF

## Scenario
You first step is enumerating the pages in the web application. The idea here is trying to find hidden files, pages and potential targets for your exploitation.

## Preparation
 In this demo we will be using some pre-compiled wordlists for fuzzing. In here, we use lists contained in the SecLists project `https://github.com/danielmiessler/SecLists`. 
 
 This project is already downloaded in your Desktop, but you are encouraged to try other wordlists or even create your own.
 
 The wordlist that we will be using can be found at:
 `/home/user/Desktop/SecLists/Discovery/Web-Content/common.txt`
![image](https://user-images.githubusercontent.com/51416867/220496933-4c382022-2a26-49fd-aee2-f02b46128169.png)

This wordlist contains the most common filenames and directory names in web applications. 

## Step 1: Basic File Enumeration
To enumerate file in a webpage is fairly simple, we just need to use the following command:
```
ffuf -w /path/to/wordlist -u https://target/FUZZ
```

In our case, this command will look like this:
```
ffuf -w /home/user/Desktop/SecLists/Discovery/Web-Content/common.txt -u https://www.nasa.gov/FUZZ -mc 200
```

Where:
```
-w /home/user/Desktop/SecLists/Discovery/Web-Content/common.txt >> is the path to the wordlist
-u https://www.nasa.gov/FUZZ >> is our target, being FUZZ the part that will be replaced by the words in the wordlist
-mc 200 >> matches only the HTTP response codes 200 (OK Success)
```

_Audition notes: using nasa.gov since globomantics.com has a WAF that blocks fuzz attempts_


## Step 2: Reviewing the Results
After executing the command, you should see the FFuF output with the positive matches for the fuzzing:
![image](https://user-images.githubusercontent.com/51416867/220497231-4ab00603-ada5-4266-ad26-27c909b9cfa2.png)

We can access one of those pages `https://www.nasa.gov/sitemap.xml` to confirm that we discovered valid contents. 
![image](https://user-images.githubusercontent.com/51416867/220497255-3f428627-35b7-44e8-b3ec-d35f4edf9b0c.png)

As you can see, the page is valid and contains some interesting information, such as the CMS platform (Drupal) on the backend.


## Step 3: Adding File Extensions
We can include extensions to the fuzzing string to try to find more webpages.
```
ffuf -w /home/user/Desktop/SecLists/Discovery/Web-Content/common.txt -u https://www.nasa.gov/FUZZ -mc 200 -e .html, .php, .txt
```

Where
	- -e .html,.php,.txt are the extensions that FFuF will append to the end of the URL

As result, we were able to find even more pages:
![image](https://user-images.githubusercontent.com/51416867/220497581-7c394a8d-4fd6-4c95-929a-29f7c34cfef0.png)

## Challenge
Now it is your turn! 
Create a FFuF command to enumerate XML files on our target!

You should be able to find at least those two XML files:
![image](https://user-images.githubusercontent.com/51416867/220497713-11613f0e-598a-4c9d-95d0-9aa7d41cb57a.png)



