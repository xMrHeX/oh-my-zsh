# ------------------------------------------------------------------------------
#
# List of vcs_info format strings:
#
# %b => current branch
# %a => current action (rebase/merge)
# %s => current version control system
# %r => name of the root directory of the repository
# %S => current path relative to the repository root directory
# %m => in case of Git, show information about stashes
# %u => show unstaged changes in the repository
# %c => show staged changes in the repository
#
# List of prompt format strings:
#
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
#
# spectrum_ls
#
# 000: Black
# 001: Red
# 002: Green
# 003: Yellow
# 004: Blue
# 005: Magenta
# 006: Cyan
# 007: White
# 008: Grey
# 009: Bold Red
# 010: Bold Green
# 011: Bold Yellow
# 012: Bold Blue
# 013: Bold Magenta
# 014: Bold Cyan
# 015: Bold White
# 016: Black
# 033: Cool Blue
# 046: Fl. Green
# 053: Deep Purple
# 093: Purple
# 125: Magenta
# 161: Dark Magenta
# 190: Fl. Yellow
# 197: Hot Pink
# 196: Red Red
# 202: Fl. Orange
# Unicode: Skull ☠💀 U+2620
# ------------------------------------------------------------------------------

setopt promptsubst
setopt promptpercent

ZSH_THEME_GIT_PROMPT_PREFIX="${return_code}%F{15}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{15}]"
ZSH_THEME_GIT_PROMPT_SEPARATOR="%F{15}|"
ZSH_THEME_GIT_PROMPT_BRANCH="%F{161}"
ZSH_THEME_GIT_PROMPT_STAGED="%F{1}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%F{1}%{✖ %2G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%F{202}%{✚ %2G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{1}%{↓·%2G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %F{46}%{↑·%2G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{4}%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{2}%{✔%G%}"

#ZSH_THEME_GIT_PROMPT_ADDED="%{$reset_color%}%{$fg[yellow]%} ✚ %{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$reset_color%}%{$fg[yellow]%} ⚑ %{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$reset_color%}%{$fg[yellow]%} ✖ %{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$reset_color%}%{$fg[yellow]%} ➜ %{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$reset_color%}%{$fg[yellow]%} ═ %{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✘%{$reset_color%}"

#	GIT_PROMPT='%(?,%F{2}✔ ,%F{1}💀 ✘-$? %f)%F{190}%~%F{196}$(git_super_status) %_$(prompt_char) '

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%F{1}#%f"; else echo "%F{196}$%f"; fi
}

PROMPT='%(?,%F{2}✔ ,%F{196}💀 ✘-$? %f)%F{2}%n%F{190}@%F{5}%m%F{6}: %F{33}%~ $(git_super_status)
%_$(prompt_char) '

RPROMPT="%F{2}[%*]%f"
