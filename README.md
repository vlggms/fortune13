### Enclave Revolutionary Server
### Welcome to the code repository of a project forked from Fortune13!

[![Build Status](https://github.com/vlggms/fortune13/workflows/CI%20Suite/badge.svg)](https://github.com/vlggms/fortune13/actions?query=workflow%3A%22CI+Suite%22)
[![Percentage of issues still open](https://isitmaintained.com/badge/open/vlggms/fortune13.svg)](https://isitmaintained.com/project/vlggms/fortune13 "Percentage of issues still open")
[![Average time to resolve an issue](https://isitmaintained.com/badge/resolution/vlggms/fortune13.svg)](https://isitmaintained.com/project/vlggms/fortune13 "Average time to resolve an issue")

## Community
[<img src=".github/assets/discord.png" alt="Discord" width="150" align="left">](https://discord.gg/CpYhRXwXfg)
Discord is the place where most of the discussion happens, due to absence of a forum. Here you can contact administrators, ask mentors for help, or simply discuss your rounds. It is also a place where you can find links to ban appeals, admin applications and others, which could be really useful.

## Information
* **Code:** https://github.com/vlggms/fortune13
* **SS13 Coderbus Discord:** https://discord.gg/Vh8TJp9
* **/tg/Station Wiki:** https://tgstation13.org/wiki/Main_Page

## DOWNLOADING

There are a number of ways to download the source code. Some are described here, an alternative all-inclusive guide is also located at http://www.tgstation13.org/wiki/Downloading_the_source_code

[Recommended] Option 1:
Follow this: http://www.tgstation13.org/wiki/Setting_up_git

Option 2: Download the source code as a zip by clicking the ZIP button in the
code tab of https://github.com/vlggms/fortune13
(note: this will use a lot of bandwidth if you wish to update and is a lot of
hassle if you want to make any changes at all, so it's not recommended.)

## INSTALLATION

First-time installation should be fairly straightforward. First, you'll need
BYOND installed. You can get it from https://www.byond.com/download. 

Once you've done that, extract the game files to wherever you want to keep them. This is a
sourcecode-only release, so the next step is to compile the server files.
Open Build.bat by double-clicking it.
This'll take a little while, and if everything's done right you'll get
a message like this:

```
saving fortune13.dmb (DEBUG mode)
fortune13.dmb - 0 errors, 0 warnings
```

If you see any errors or warnings, something has gone wrong - possibly a corrupt
download or the files extracted wrong. If problems persist, ask for assistance
on the Discord.

Once that's done, open up the config folder. You'll want to edit config.txt to
set the probabilities for different gamemodes in Secret and to set your server
location so that all your players don't get disconnected at the end of each
round. It's recommended you don't turn on the gamemodes with probability 0,
except Extended, as they have various issues and aren't currently being tested,
so they may have unknown and bizarre bugs. Extended is essentially no mode, and
isn't in the Secret rotation by default as it's just not very fun.

You'll also want to edit config/admins.txt to remove the default admins and add
your own. "Game Master" is the highest level of access, and probably the one
you'll want to use for now. You can set up your own ranks and find out more in
config/admin_ranks.txt

This codebase also depends on a native library called rust-g. A precompiled
Windows DLL is included in this repository, but Linux users will need to build
and install it themselves. Directions can be found at the [rust-g
repo](https://github.com/tgstation13/rust-g).

Finally, to start the server, run Dream Daemon and enter the path to your
compiled fortune13.dmb file. Make sure to set the port to the one you
specified in the config.txt, and set the Security box to 'Safe'. Then press GO
and the server should start up and be ready to join. It is also recommended that
you set up the SQL backend (see below).

## UPDATING

To update an existing installation, first back up your /config and /data folders
as these store your server configuration, player preferences and banlist.

Then, extract the new files (preferably into a clean directory, but updating in
place should work fine), copy your /config and /data folders back into the new
install, overwriting when prompted except if we've specified otherwise, and
recompile the game.  Once you start the server up again, you should be running
the new version.

## SQL SETUP

The SQL backend requires a Mariadb server running 10.2 or later. Mysql is not supported but Mariadb is a drop in replacement for mysql. SQL is required for the library, stats tracking, admin notes, and job-only bans, among other features, mostly related to server administration. Your server details go in /config/dbconfig.txt, and the SQL schema is in /SQL/tgstation_schema.sql and /SQL/tgstation_schema_prefix.sql depending on if you want table prefixes.  More detailed setup instructions are located here: https://www.tgstation13.org/wiki/Downloading_the_source_code#Setting_up_the_database

## WEB/CDN RESOURCE DELIVERY 

Web delivery of game resources makes it quicker for players to join and reduces some of the stress on the game server.

1. Edit compile_options.dm to set the `PRELOAD_RSC` define to `0`
1. Add a url to config/external_rsc_urls pointing to a .zip file containing the .rsc.
    * If you keep up to date with /tg/ you could reuse /tg/'s rsc cdn at http://tgstation13.download/byond/tgstation.zip. Otherwise you can use cdn services like CDN77 or cloudflare (requires adding a page rule to enable caching of the zip), or roll your own cdn using route 53 and vps providers.
	* Regardless even offloading the rsc to a website without a CDN will be a massive improvement over the in game system for transferring files.

## CONTRIBUTING

Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md)

## LICENSE
[![license-badge](https://www.gnu.org/graphics/agplv3-155x51.png)](https://www.gnu.org/licenses/agpl-3.0.html)

All code after [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU AGPL v3](https://www.gnu.org/licenses/agpl-3.0.html).

All code before [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html).
(Including tools unless their readme specifies otherwise.)

See LICENSE and GPLv3.txt for more details.

The TGS DMAPI API is licensed as a subproject under the MIT license.

See the footer of [code/__DEFINES/tgs.dm](./code/__DEFINES/tgs.dm) and [code/modules/tgs/LICENSE](./code/modules/tgs/LICENSE) for the MIT license.

All assets including icons and sound are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.
