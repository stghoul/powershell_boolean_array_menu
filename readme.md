## Boolean array selectable menu

#### How to use

first, you shoult import this script as module
```
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/stghoul/powershell_boolean_array_menu/main/boolean-array-menu.psm1" -OutFile "boolean-array-menu.psm1"
Import-Module ./boolean-array-menu.psm1
```

After that, in your script, you will need some hash-table with boolean values.
Like that:
```
$some_hash_table = @{
	'Menu item 4' = $false
	'Menu item 1' = $true
	'Menu item 3' = $false
	'Menu item 2' = $true
	'Menu item 5' = $true
}
```

Also, you should get some title for you menu
```
$some_string = "Select something"
```

And pass them to function boolean-array-menu
```
$some_hash_table = boolean-array-menu -array $some_hash_table -title $some_string
```

When this wil be executed, you can use up and down arrows to move pointer, spacebar to select and unselect menu options and enter to return back to script.
