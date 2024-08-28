echo "Enter project name (without spaces): "

read name

echo "Creating project $name"

mkdir $name

cd $name

touch index.html style.css

echo '<!DOCTYPE html>' > index.html
echo '<html lang="en">' >> index.html
echo '<head>' >> index.html
echo '    <meta charset="UTF-8">' >> index.html
echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> index.html
echo "    <title> $name </title>" >> index.html
echo '</head>' >> index.html
echo '<body>' >> index.html
echo '    <!-- Your content goes here -->' >> index.html
echo "    <h1> Happy Hacking! $name . </h1>" >> index.html
echo "    <p style='margin-top:30px; font-size:20px;'> For Webdevelopment, Scripts and Automations contact <a href='https://github.com/Syed-Saleh-Programmer/' style='fot-size:24px; font-weight:bold; background:black; color:white; padding:10px; border-radius:5px; text-decoration:none; cursor:pointer;'>Syed Muhammad Saleh</a>. </p>" >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html

printf '*{\n padding:0;\n margin:0;\n box-sizing:border-box;\n}' > style.css

code .


# Get the current directory path
current_dir=$(pwd)

# Convert Unix-style path to Windows-style path
windows_path=$(cygpath -w "$current_dir")

# Add the file URL prefix
file_url="file:///$windows_path"

# Replace backslashes with forward slashes
file_url=$(echo "$file_url" | sed 's/\\/\//g')

# Open the file in Chrome
start chrome "$file_url/index.html"


echo "Project setup successfully."













