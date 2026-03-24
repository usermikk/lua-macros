-- Pomocné proměnné pro dvojklik
local posledni_stisk = 0

-- 1. Identifikace: Po kliknutí na Run zmáčkni klávesu na MAKRO klávesnici
lmc_assign_keyboard('MAKRO_KB')

-- 2. Hlavní funkce
lmc_set_handler('MAKRO_KB', function(button, direction)
  if (direction == 0) then return end

  -- SEZNAM MAKER
  if (button == 112) then lmc_send_input(173, 0, 0) -- F1: Mute
  elseif (button == 113) then lmc_send_input(174, 0, 0) -- F2: Vol-
  elseif (button == 114) then lmc_send_input(175, 0, 0) -- F3: Vol+
  elseif (button == 115) then
    lmc_spawn("cmd", '/c start "" "C:\\Program Files\\VideoLAN\\VLC\\vlc.exe" "E:\\phonk"') -- F4: VLC
  elseif (button == 116) then
    lmc_spawn("cmd", "/c taskkill /F /IM vlc.exe /T") -- F5: Kill VLC
  elseif (button == 117) then lmc_send_input(176, 0, 0) -- F6: Next
  elseif (button == 118) then lmc_send_input(179, 0, 0) -- F7: Pause
  elseif (button == 119) then lmc_send_input(177, 0, 0) -- F8: Prev
  elseif (button == 120) then
    lmc_spawn("C:\\Program Files\\Mozilla Firefox\\firefox.exe", "https://mail.google.com") -- F9: Gmail
  elseif (button == 121) then lmc_send_keys('#d') -- F10: Plocha

  -- F11 (122) = TOTÁLNÍ ČISTKA NA DVOJKLIK (ZAVŘE I FIREFOX)
  elseif (button == 122) then
    local ted = os.clock()
    if (ted - posledni_stisk < 0.8) then
        -- 1. Sestřelí plochu (Explorer)
        lmc_spawn("cmd", "/c taskkill /F /IM explorer.exe")
        -- 2. Zavře VŠECHNA okna (včetně Firefoxu), kromě LuaMacros a po pauze nahodí plochu
        lmc_spawn("powershell", "-WindowStyle Hidden -Command \"Get-Process | Where-Object { $_.MainWindowTitle -and $_.ProcessName -notmatch 'LuaMacros|explorer' } | Stop-Process; Start-Sleep -s 3; & $env:SystemRoot\\explorer.exe\"")
        posledni_stisk = 0
    else
        posledni_stisk = ted
        print("Zmackni F11 znovu pro TOTALNI CISTKU!")
    end

  elseif (button == 123) then lmc_spawn("calc.exe") -- F12: Kalkulačka
  elseif (button == 44) then
    lmc_send_input(44, 0, 0); lmc_send_input(44, 0, 2) -- PrtSc

  -- VŠE OSTATNÍ (Aby klávesnice normálně psala)
  else
    lmc_send_input(button, 0, 0)
    lmc_send_input(button, 0, 2)
  end
end)

