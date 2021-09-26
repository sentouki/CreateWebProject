if [[ -z "$1" ]]; then
    echo "Missing project name"
    exit 1
fi

if [[ "$1" == *"/"* ]]; then
    IFS='/' read -ra path <<< $1
    projectName="${path[-1]}"
else
    projectName="$1"
fi

echo "Creating $projectName ..."


HTML_TEMPLATE="<!DOCTYPE html>\n
<html lang=\"en\">\n\n

<head>\n
\t  <title>$projectName</title>\n
\t  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\"/>\n
\t  <meta charset=\"utf-8\"/>\n
\t  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n
</head>\n\n

<body>\n
\t  <header>\n
\t\t    <h1>$projectName</h1>\n
\t  </header>\n
\t  <main></main>\n
\t  <script src=\"js/main.js\"></script>\n
</body>\n\n

</html>"

JS_PATH="$1/js/main.js"
CSS_PATH="$1/css/main.css"

if !(mkdir "$1" 2> /dev/null); then
    echo "Failed creating directory $1"
    exit 1
fi

if !(mkdir "$1/css" 2> /dev/null); then
    echo "Failed creating directory $1"
    exit 1
fi

if !(mkdir "$1/js" 2> /dev/null); then
    echo "Failed creating directory $1"
    exit 1
fi

if echo -e $HTML_TEMPLATE > "$1/index.html"; then
    echo "Created $1/index.html"
else
    echo "Failed creating $1/index.html"
    exit 1
fi

if touch $CSS_PATH; then
    echo "Created $CSS_PATH"
else
    echo "Failed creating $CSS_PATH"
    exit 1
fi

if touch $JS_PATH; then
    echo "Created $JS_PATH"
else
    echo "Failed creating $JS_PATH"
    exit 1
fi

echo "Project created!"