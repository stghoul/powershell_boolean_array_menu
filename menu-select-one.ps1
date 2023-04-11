function menu-select-one ($array, $title) {
	
	<#
		.SYNOPSIS
			Creates a munu with arrows control.
		
		.DESCRIPTION
			Creates menu, where user can navigate via arrow buttons.
			As result, function will return one string.

		.EXAMPLE
			# first, create an array
			$menu_array = @(
			"Menu item 1"
			"Menu item 2"
			"Menu item 3"
			"Menu item 4"
			"Menu item 5"
			)
			
			# create menu title 
			$menu_title = "Fancy Menu Title"
			
			# call function
			menu-select-one -array $menu_array -title $menu_title
			
	#>
	
	$cursor_visible = [Console]::CursorVisible
	[Console]::CursorVisible = $false

	$pointer = 1
	
	$default_background_color = (get-host).ui.rawui.BackgroundColor
	$default_foreground_color = (get-host).ui.rawui.ForegroundColor
	
	$pointer_background_color = $host.privatedata.VerboseBackgroundColor
	$pointer_foreground_color = $host.privatedata.VerboseForegroundColor
	
	while ($true) {
		
		# Рисуем меню
		$pos = 0
		Clear-Host
		Write-Host "---" $title "---"
		foreach ($i in $array) {
			$pos++
			if ($pos -eq $pointer) {
				$background_color = $pointer_background_color
				$foreground_color = $pointer_foreground_color
			} else {
				$background_color = $default_background_color
				$foreground_color = $default_foreground_color
			}
			Write-Host -BackgroundColor $background_color -ForegroundColor $foreground_color "[$pos] $i"
		}
		
		# ожидаем нажатя кнопки
		$key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
		
		# обрабатываем нажатие кнопки
		switch ($key.VirtualKeyCode) {
			#---
			# up arrow
			# перемещаемся по списку вверх
			38 {
				$pointer--
				if ($pointer -eq 0) {
					$pointer = $array.count
				}
			}
			#---
			# down arrow
			# перемещаемся по списку вниз
			40 {
				$pointer++
				if ($pointer -gt $array.count) {
					$pointer = 1
				}
			}
			#---
			# q
			# выходим из меню
			81 {
				[Console]::CursorVisible = $cursor_visible
				return $array[$pointer - 1]
			}
			# enter
			13 {
				[Console]::CursorVisible = $cursor_visible
				return $array[$pointer - 1]
			}
			#---
			# 1234567890
			49 {
				[Console]::CursorVisible = $cursor_visible
				return $array[0]
			}
			50 {
				[Console]::CursorVisible = $cursor_visible
				return $array[1]
			}
			51 {
				[Console]::CursorVisible = $cursor_visible
				return $array[2]
			}
			52 {
				[Console]::CursorVisible = $cursor_visible
				return $array[3]
			}
			53 {
				[Console]::CursorVisible = $cursor_visible
				return $array[4]
			}
			54 {
				[Console]::CursorVisible = $cursor_visible
				return $array[5]
			}
			55 {
				[Console]::CursorVisible = $cursor_visible
				return $array[6]
			}
			56 {
				[Console]::CursorVisible = $cursor_visible
				return $array[7]
			}
			57 {
				[Console]::CursorVisible = $cursor_visible
				return $array[8]
			}
			58 {
				[Console]::CursorVisible = $cursor_visible
				return $array[9]
			}
			
			95 {
				[Console]::CursorVisible = $cursor_visible
				return $array[0]
			}
			96 {
				[Console]::CursorVisible = $cursor_visible
				return $array[1]
			}
			97 {
				[Console]::CursorVisible = $cursor_visible
				return $array[2]
			}
			98 {
				[Console]::CursorVisible = $cursor_visible
				return $array[3]
			}
			99 {
				[Console]::CursorVisible = $cursor_visible
				return $array[4]
			}
			100 {
				[Console]::CursorVisible = $cursor_visible
				return $array[5]
			}
			101 {
				[Console]::CursorVisible = $cursor_visible
				return $array[6]
			}
			102 {
				[Console]::CursorVisible = $cursor_visible
				return $array[7]
			}
			103 {
				[Console]::CursorVisible = $cursor_visible
				return $array[8]
			}
			104 {
				[Console]::CursorVisible = $cursor_visible
				return $array[9]
			}
		}
	}
}
