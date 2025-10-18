instance_create_depth(80,0,-999,TurnOnAni);
dayAlp = 1.0;
pauseAlp = 0.0;
dayAlp = 1.0
daySpeed = 1;
dayX = W/2;
dayXX = 0;
dayTimer = 60;
global.bankrupt = false;
scSavegame();
global.time = 12_000;
if (room == TitleScreen && gameStartBuf < 0) scMusicChange(1);