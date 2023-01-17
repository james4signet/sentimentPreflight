# sentimentPreflight
Bash, Zsh scripts and Python script that uses awk sed grep and Beautiful soup (on Python script)

# Description:

The terminal script versions are examples of how to extract text from a website and perform basic sentiment analysis using the command-line tools in bash and zsh. In both versions, the script uses curl command to retrieve the website's HTML, it then uses grep command to extract the text from the HTML, and awk command to analyze the sentiment of the text by computing the average sentiment score of the text. The scripts then uses printf command to format the output and display the sentiment score of the website. In addition, the script allows the user to enter the website URL via a command line prompt, this enables the user to analyze the sentiment of different websites by just changing the URL.

Contents of this repo:

* preflightB.sh (Bash shell)
* preflightZ.sh (Z shell)
* processPreflight.py (Python script)

## Comments about using grep, awk, or sed to extract the text Bash

* The above code snippet will check the exit status of each command, if the command fails it will print an error message and exit with a status of 1, otherwise it will continue to execute the next command.

* The scripts will retrieve the HTML of the website https://example.com, extract the text between <p> tags and store it in a file called website_text.txt, then it will use awk to analyze the sentiment of the text by looking at the last column of each line and averaging them. It will then use the printf command to format the sentiment value to 2 decimal places and print it to the console.

## How Sentiment works for these scripts

For each line of text, it adds the last field of the line ($NF) to the variable sentiment if it is greater than 1. If the last field is not greater than 1, it adds 1 to the variable sentiment. It increments the variable total by 1. In the end, it divides the sentiment by total to get the average sentiment score.
> It is important to note that this script assume that the text file already has a sentiment score assigned to each line of text, this can be done by pre-processing the text before running the script, this is not done by the script as it assumes that the text is already pre-processed.
