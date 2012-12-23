# gitolite cookbook

Installs gitolite

- [gitolite](https://github.com/sitaramc/gitolite)

# Requirements

# Usage

# Attributes

## Required

|Attribute|Description|Default Value|
|---|---|---|
|`public_key`|Your public key string| - |

## Optional

|Attribute|Description|Default Value|
|---|---|---|
|`user`|user name for gitolite|`git`|
|`group`|group name for gitolite|`git`|
|`home`|home directory for gitolite user|`/var/git`|
|`gitolite_url`|gitolite repository url|`git://github.com/sitaramc/gitolite.git`|
|`gitolite_reference`|gitolite repository reference|`master`|
|`gitolite_home`|gitolite checkout directory|`#{node['gitolite']['home']}/gitolite`|
|`umask`|umask for gitolite|`0007`|

# Recipes

- `gitolite::default`

# Author

- Ryosuke IWANAGA (<riywo.jp@gmail.com>)
