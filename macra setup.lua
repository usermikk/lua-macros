-- 1. Klikni na Run a pak zmáčkni klávesu na MAKRO klávesnici
lmc_assign_keyboard('MAKRO_KB')

-- 2. Při stisku vypíše ID do logu
lmc_set_handler('MAKRO_KB', function(button, direction)
  if (direction == 1) then
    lmc_print_devices() -- Toto vypíše seznam všech zařízení
    print("Koukni se do logu výše na řádek, kde je napsáno 'MAKRO_KB'")
  end
end)

