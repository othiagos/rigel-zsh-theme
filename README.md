# Theme Rigel

## **Dependence**
* terminal: [Zsh](https://www.zsh.org/) 
* framework: [Oh My Zsh](https://ohmyz.sh/)

### **Download via curl**
```bash
curl https://raw.githubusercontent.com/othiagos/rigel-zsh-theme/master/rigel.zsh-theme -sO --output-dir $ZSH_CUSTOM/themes/
```

### **Download via wget**
```bash
wget https://raw.githubusercontent.com/othiagos/rigel-zsh-theme/master/rigel.zsh-theme -qP $ZSH_CUSTOM/themes/
```

### **Set Rigel Theme**
```bash
sed -i 's/ZSH_THEME="\([^"]\|\\"\)*"/ZSH_THEME="rigel"/g' ~/.zshrc
```

## **Setup**
Adding configuration to `~/.zshrc`

Open your `~/.zshrc` file and append the following configurations:


```bash
# Set to 0 to disable, 1 to enable; other values are considered as enabled
export VIRTUAL_ENV_DISABLE_PROMPT=0 #required
export USER_INFO_DISABLE_PROMPT=0 #optional
export SPACE_BEFORE_COMMAND_DISABLE_PROMPT=0 #optional
```
### Configuration Details

**VIRTUAL_ENV_DISABLE_PROMPT**
This setting controls the visibility of virtual environments in the prompt when available

**USER_INFO_DISABLE_PROMPT**
Enabling this option displays the user's name and machine information in the prompt in the format "<user_name> in <machine_name>"

**SPACE_BEFORE_COMMAND_DISABLE_PROMPT**
When activated, this setting adds a line break before the command prompt

### Additional Notes
* Ensure you have a Nerd Font installed and configured as your terminal font to properly render icons and glyphs used in the prompt
* Ensure that you've saved your `~/.zshrc` file after making these changes
* Restart your Zsh shell or execute `source ~/.zshrc` for changes to take effect

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

## **Screenshot**
![image1](https://raw.githubusercontent.com/othiagos/rigel-zsh-theme/master/images/image1.png)
![image2](https://raw.githubusercontent.com/othiagos/rigel-zsh-theme/master/images/image2.png)