# Prompt for website URL
read "url?Enter the website URL: "

# Retrieve the website's HTML using curl
curl -s $url > website.html || { echo "Error: failed to retrieve website HTML" ; exit 1; }

# Extract the text using grep
grep -o '<p>[^<]*</p>' website.html | sed 's/<[^>]*>//g' > website_text.txt || { echo "Error: failed to extract website text" ; exit 1; }

# Analyze the sentiment using awk
sentiment=$(awk '{sentiment += (NF>1 ? $NF : 1); total++} END {print sentiment/total}' website_text.txt) || { echo "Error: failed to analyze the sentiment" ; exit 1; }

#Format the output
printf "The sentiment of the website is: %.2f\n" $sentiment
