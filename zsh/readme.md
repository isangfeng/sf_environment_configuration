In this repository, I record the configuration of my terminal to make setup easier when I get a new computer.

## Requirements

Before configuring, you need to install some packages and tools first:
- **antidote**: a zsh plugin management.
- **fzf**: it is needed by fzf-tab plugin. It is for fuzzy searching in the command.
- **eza**: it is an alternative command for ls.
- **bat**: an alternative command for cat, and it used by fzf-tab plugin.
- **zoxide**: a more intelligent cd command.
- **starship**: a command prompt.

Install them with homebrew:
```bash
brew install antidote fzf eza bat zoxide starship
```
## Settings
### antidote
Several zsh plugins need to be installed. Although I have forgotten what each one is for, I install them according to the plugin file, `.zsh_plugins.txt`. All you need to do is create this file in your home folder and list the plugin names, or copy your previous plugin file there.
### starship
The configuration file is `starship.toml`, located in `~/.config`. An example of my configuration is shown below:
```toml
"$schema" = 'https://starship.rs/config-schema.json'
format = """ $username\ $hostname\ $directory\ $git_branch\ $git_state\ $git_status\ $cmd_duration\ $line_break\ $conda\ $python\ $character"""
[directory]
style = "blue"
[character]
success_symbol = "[❯](purple)"
error_symbol = "[❯](red)"
vimcmd_symbol = "[❮](green)"
[git_branch]
format = "[$branch]($style)"
style = "bright-black"
[git_status]
format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)"
style = "cyan"
conflicted = ""
untracked = ""
modified = ""
staged = ""
renamed = ""
deleted = ""
stashed = "≡"
[git_state]
format = '\([$state( $progress_current/$progress_total)]($style)\) '
style = "bright-black"
[cmd_duration]
format = "[$duration]($style) "
style = "yellow"
[conda]
format = "[$environment]($style) "
style = "bright-black"
ignore_base = false
[python]
format = "[$virtualenv]($style) "
style = "bright-black"
detect_extensions = []
detect_files = []
```
**Note**: To remove the prompt provided by conda, set `changeps1: false` in `~/.condarc`.
### zsh
All zsh settings are in the `.zshrc` file.