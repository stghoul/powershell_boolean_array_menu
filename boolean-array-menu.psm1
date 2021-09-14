#################
# Moveable menu #
#################

# Функция, принимающая на вход хеш-таблицу с объектами, имеющими значения $true или $false
# и позволяющая стрелками и пробелом менять значения.
# На выходе возвращает ту же хеш-таблицу но с измененными значениями.


function boolean-array-menu ($array, $title) {
	$pointer = 1
	$default_color = (get-host).ui.rawui.BackgroundColor
	
	$pointer_color = "red"
	if ($default_color -eq "red") {$pointer_color = "DarkMagenta"}
	
	while ($true) {
		
		# Рисуем меню
		$pos = 0
		Clear-Host
		Write-Host "---" $title "---"
		foreach ($i in ($array.GetEnumerator() | sort -Property name)) {
			$pos++
			if ($pos -eq $pointer) { $color = $pointer_color } else {$color = $default_color}
			
			if ($i.value -eq $true) {
				Write-Host -BackgroundColor $color '[v]' $i.name
			} else {
				Write-Host -BackgroundColor $color '[ ]' $i.name
			}
		}
		
		# ожидаем нажатя кнопки
		$key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
		
		# обрабатываем нажатие кнопки
		switch ($key.VirtualKeyCode) {
			#---
			# spacebar
			# изменяем значение выбранного пункта
			32 {
				#$array = menu-change($pass_this)
				$name = ($array.GetEnumerator() | sort -Property name)[$pointer - 1].name
				if ($array.$name) {
					$array.$name = $false
				} else {
					$array.$name = $true
				}
			}
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
				return $array
			}
			# enter
			13 {
				return $array
			}
			#---
		}
	}
}