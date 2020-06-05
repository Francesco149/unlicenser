Simple script to generate contributor agreements for the UNLICENSE. See https://unlicense.org/
for more info on the UNLICENSE.

The script will try to auto detect your project's url by taking the first git branch. If it doesn't
find a git repo, it will fall back to your folder name. An official URL is better than just the
project name because it's more explicit, so feel free to edit the generated files.

It will also append to your `pull_request_template.md` and `CONTRIBUTING.md` . Feel free to edit
and move those additions according to your preferred structure

# Installing

```sh
git clone https://github.com/Francesco149/unlicenser
sudo cp unlicenser/unlicense.sh /usr/local/bin/unlicense
sudo chmod +x /usr/local/bin/unlicense
```

# Usage

```sh
cd /path/to/my/project
unlicense
```
