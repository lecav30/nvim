# Neovim Files of Sebastian Levano

## Requeriments:

- [Node (NPM)](https://formulae.brew.sh/formula/node)
- [Clang (LLVM)](https://formulae.brew.sh/formula/llvm)
- [Cargo (Rust) ](https://doc.rust-lang.org/cargo/getting-started/installation.html)

# MacOS

## Installation with Homebrew:

```bash
brew install neovim ast-grep
```

## Mason to PATH

```bash
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
```

# Windows

## Installation with Scoop:

```powershell
scoop install main/neovim
```

```powershell
scoop install llvmtree-sitter ripgrep fd unzip wget gzip coreutils ast-grep
```

### For VimTex

```powershell
scoop install miktex perl
```

## Providers

```bash
npm install -g neovim
pip install pynvim
```

# Linux

## Installation with Scoop:

```bash
pacman -Syu neovim
```

```bash
pacman -Syu node npm llvm clang unzip rust tree-sitter 
```

```bash
cargo install tree-sitter-cli
```

And you have to add it to your PATH

