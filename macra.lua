-- Registrace tvé klávesnice přes ID
lmc_device_set_name('MAKRO_KB', 'VID_1C4F&PID_008F&MI_00')

lmc_set_handler('MAKRO_KB', function(button, direction)
  if (direction == 0) then return end -- Reaguje jen na stisknutí

  -- SEZNAM MAKER (F1-F12, PrtSc)
  if (button == 112) then lmc_send_input(173, 0, 0) -- F1: Mute
  elseif (button == 113) then lmc_send_input(174, 0, 0) -- F2: Vol-
  elseif (button == 114) then lmc_send_input(175, 0, 0) -- F3: Vol+
  elseif (button == 115) then lmc_spawn("cmd", '/c start "" "C:\\Program Files\\VideoLAN\\VLC\\vlc.exe" "E:\\phonk"') -- F4: VLC
  elseif (button == 116) then lmc_spawn("cmd", "/c taskkill /F /IM vlc.exe /T") -- F5: Kill VLC
  elseif (button == 117) then lmc_send_input(176, 0, 0) -- F6: Next
  elseif (button == 118) then lmc_send_input(179, 0, 0) -- F7: Pause
  elseif (button == 119) then lmc_send_input(177, 0, 0) -- F8: Prev

  -- F9 (120) = Firefox + Gmail
  elseif (button == 120) then
    lmc_spawn("C:\\Program Files\\Mozilla Firefox\\firefox.exe", "https://mail.google.com")

  elseif (button == 121) then lmc_send_keys('#d') -- F10: Plocha
  elseif (button == 123) then lmc_spawn("calc.exe") -- F12: Kalkulačka
  elseif (button == 44) then lmc_send_input(44, 0, 0); lmc_send_input(44, 0, 2) -- PrtSc

  -- VŠE OSTATNÍ (VYNUCENÉ PSÁNÍ)
  else
    lmc_send_input(button, 0, 0) -- Stisk
    lmc_send_input(button, 0, 2) -- Uvolnění
  end
end)



