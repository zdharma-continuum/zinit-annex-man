# z-p-zman

A Zsh-Zplugin extension that automatically generates:

  - man pages for all plugins and snippets (out of plugin README.md files by
    using [ronn](https://github.com/rtomayko/ronn) converter),
  - code-documentation manpages (by using
    [zshelldoc](https://github.com/zdharma/zshelldoc) project).

Zman extension is being activated at clone of a plugin and also at update of it
and it then generates the manpages. To view them there's a `zman` command:

```zsh
# View README.md manpage in the terminal
zman z-p-zman
# View the code documentation (via the full plugin name, as demonstrated)
zman -c zdharma/z-p-zman
```

# Screenshots

Main manual (of the Zman project):

![README](https://raw.githubusercontent.com/zdharma/z-p-zman/master/images/zman-readme.png)

Code documentation for the plugin.zsh file (of the Zman project):

![Code documentation](https://raw.githubusercontent.com/zdharma/z-p-zman/master/images/zman-cd.png)

<!-- vim:set ft=markdown tw=80: -->
