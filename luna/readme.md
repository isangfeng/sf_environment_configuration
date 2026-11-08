There are some noted information when I installed luna last week, however, I forgot what they are. So, I record steps provided in Luna's document. And when I have some issue during installation later, I will record them then.

## Luna

The installation instruction shows here: https://zzz-luna.org/luna/download.

The earies way to install is downloading the executable files into your computer and add its path into ```PATH``` system environment variable.

In my computer that runs macos, adding command shown below into ```.zshrc``` file and source it to make configuration effect.

```bash
export NEUROKITS_DIR=~/neurokits
export PATH=${PATH}:${NEUROKITS_DIR}/luna-v1.7.0
```

## lunapi

lunapi (luna pi) is the python version of luna. Install it by pip.

```bash
pip install lunapi
```

## LunaScope

lunascpe is a interactive GUI of luna. It could show eeg data and process data interactively.

Same way with lunapi installation, lunascope could be installed by pip.

```bash
pip install luncascope
```

