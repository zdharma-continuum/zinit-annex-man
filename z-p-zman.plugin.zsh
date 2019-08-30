# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

typeset -g ZMAN_REPO_DIR="${0:h}"
typeset -g ZMAN_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/z-p-zman"

zman() {
    "$ZMAN_REPO_DIR/zman" "$ZMAN_REPO_DIR" "${ZPLGM[PLUGINS_DIR]}" \
        "${ZPLGM[SNIPPETS_DIR]}" "$@";
}

autoload -Uz :zp-zman-handler

zman-inst() {
    print -P -- "\n%F{38}zman z-plugin: \%F{154}Installing %F{220}$1%F{154} gem locally in the z-p-zman directory...%f"
}

# Check if ronn dependencies are installed
local zman_dep
local -a farray
for zman_dep in hpricot rdiscount mustache; do
    farray=( $ZMAN_REPO_DIR/gems/$zman_dep-*(N[1]) )
    [[ ! -d ${farray[1]} ]] && \
        { zman-inst "$zman_dep"; gem install -i "$ZMAN_REPO_DIR" "$zman_dep"; }
done

unset -f zman-inst

@zplg-register-z-plugin "z-p-zman" hook:atclone \
    :zp-zman-handler \
    :zp-zman-help-handler \
    "zman''" # register a new ice-mod: zman''

@zplg-register-z-plugin "z-p-zman" hook:atpull \
    :zp-zman-handler \
    :zp-zman-atpull-help-handler


zstyle ':completion:*:zman:argument-rest:plugins' list-colors '=(#b)(*)/(*)==1;35=1;33'
zstyle ':completion:*:zman:argument-rest:plugins' matcher 'r:|=** l:|=*'
