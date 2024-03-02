
# NativeUI San Andreas V3.0 

FiveM/Gta5-Style NativeUI For Multi Theft Auto San Andreas



![Logo](https://lh3.googleusercontent.com/proxy/lfIDKrcfFCIDEJkk1bxNFz5lw2USVVSSvMnImkbOY5-NE6I5HX7iZaY7F6zhGaE_K5fMDdZFDA3K8e0beAJmYucPVT-eQ7PJZG4UPrcD7Li9HAqUhaVJ)


## Installation

```
1. Download the repository
2. Rename the ressource folder to NativeUI
3. Run the ressource using this CMD:  <start NativeUI> (for native server)
```
## Features

- Responsive
- Easy to use
- Full Fonctions
- Free to use


# API Reference

## Functions 

### Import to client file

```lua
 local NativeUI = exports["NativeUI"]
```

### Create New Menu
```lua
    local menu_id = NativeUI:CreatePool(title = false,menu_description = false ,image = false,useBackSpace = false,maxVisibleRows = false)
```

### Add Tab
```lua
    NativeUI:addTab(Meni_id = 1,tabType, tabText,tabEvent,selectTable,descr)
```

### Tab Types

| Tab Type    | description |
| -------- | ------- |
| text  | read only button    |
| button | clickable button     |
| select    | switch tab need **selectTab argument**    |
| check      | checkbox button   |

### Delete Tab 
```lua
    NativeUI:DeleteTab (menu_id,tab_id)
```

### Get Visible Menus 
```lua
    list: NativeUI:GetShowingPools()
```

### Get Current Hovred Tab 
```lua
    tab_id = NativeUI:GetCurrentTab()
```

### Get Current Selected Element (select tab only)

```lua
    current_select_id = NativeUI:GetCurrentSelect(menu_id,tab_id)

```
### Clear menu from tabs 

```lua
    NativeUI:ClearPool(menu_id = 1)
```

### Delete Menu
```lua
    NativeUI:DeletePool(menu_id = 1)
```

## Events


Rage.onTabEnter : Whene a tab Pressed 

|  CallBack Parametres | description  |
|---|---|
| tab  | id of the pressed tab|
|event| event name of the pressed tab|

--------------------------
#### 


Rage.onUseBackspace

|  CallBack Parametres | description  |
|---|---|
| menu  | id of the closed menu|


--------------------------
#### 

Rage.onCheckChange

Rage.onUseBackspace

|  CallBack Parametres | description  |
|---|---|
| menu  | id of the closed menu|


--------------------------
#### 

Rage.onTabChange

|  CallBack Parametres | description  |
|---|---|
| tab  | id of the hovred tab|
|event| event name of the hovred tab|

--------------------------
#### 

Rage.onWindowClose

|  CallBack Parametres | description  |
|---|---|
| menu  | id of the closed menu|


--------------------------
#### 


Rage.onSelectChange

|  CallBack Parametres | description  |
|---|---|
| tab  | id of the hovred tab|
|SelectHovredItem| current hovred select item|

--------------------------
#### 

**Other Events**

* Rage.onButtonEnter
* Rage.onCheckEnter
* Rage.onSelectEnter
## Feedback

If you have any feedback, please reach out to us at scooma.money@gmail.com


## Support Us

You can donate for us if you want to support us for more .

https://paypal.me/AliAITADDI?country.x=MA&locale.x=en_US
