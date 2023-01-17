# Prompt for website URL
read -p "Enter the website URL: " url

# Retrieve the website's HTML using curl
curl -s $url > website.html || { printf "Error: failed to retrieve website HTML\n" ; exit 1; }

# Extract the text using grep
grep -o '<p>[^<]*</p>' website.html | sed 's/<[^>]*>//g' > website_text.txt || { printf "Error: failed to extract website text\n" ; exit 1; }

# Analyze the sentiment using awk
sentiment=$(awk '{sentiment += (NF>1 ? $NF : 1); total++} END {print sentiment/total}' website_text.txt) || { printf "Error: failed to analyze the sentiment\n" ; exit 1; }

#Format the output
printf "The sentiment of the website is: %.2f\n" $sentiment
