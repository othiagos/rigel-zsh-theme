# Theme Rigel

## **Screenshot**
![image1](https://raw.githubusercontent.com/othiagos/rigel-zsh-theme/master/images/image1.png)
![image2](https://raw.githubusercontent.com/othiagos/rigel-zsh-theme/master/images/image2.png)

## **Dependence**
* terminal: [Zsh](https://www.zsh.org/) 
* framework: [Oh My Zsh](https://ohmyz.sh/)

### **Download via curl**
```bash
curl https://raw.githubusercontent.com/othiagos/rigel-zsh-theme/master/rigel.zsh-theme -sO --output-dir ./test $ZSH_CUSTOM/themes/
```

### **Download via wget**
```bash
wget https://raw.githubusercontent.com/othiagos/rigel-zsh-theme/master/rigel.zsh-theme -qP $ZSH_CUSTOM/themes/
```

### **Set Rigel Theme**
```bash
sed -i 's/ZSH_THEME="\([^"]\|\\"\)*"/ZSH_THEME="rigel"/g' ~/.zshrc
```

#### **Add the following to `~/.zshrc`**
Use 0 to enable the visualization of the virtual environment, any other value is considered as disabled

```bash
export VIRTUAL_ENV_DISABLE_PROMPT=0
```

## **Git Status**

> `[+]` Displayed when there are staged changes.  
> `[!]` Displayed when there are unstaged changes.  
> `[✗]`	Displayed when there are deleted files.  
> `[»]`	Displayed when renamed files are staged.  
> `[=]`	Displayed when there are merge conflicts.  
> `[?]`	Displayed when there are untracked files.  
> `[$]`	Displayed when there are stashed changes.  
> `[⇡]`	Displayed when the local branch is ahead of remote.  
> `[⇣]`	Displayed when the local branch is behind remote.  
> `[⇕]`	Displayed when the local and remote branches have diverged.