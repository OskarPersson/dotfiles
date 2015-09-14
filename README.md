# Dotfiles

## Getting Started

Clone this repo, then run the following in a terminal:

```bash
cd ~
git clone http//github.com/OskarPersson/dotfiles
cd dotfiles
./init.sh
```

#[Homebrew](http://brew.sh)
Simply do
```bash
./brew.sh
```

#[Atom](http://atom.io/)

When atom is installed, do the following

```bash
# after Atom is installed
apm install --packages-file atom/my-packages.txt

# later, update the list
apm list --installed --bare > atom/my-packages.txt
```
