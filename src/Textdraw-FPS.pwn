/*
 * Textdraw-FPS Filterscript for SA-MP (San Andreas Multiplayer)
 * Copyright (c) Calasans
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

#define FILTERSCRIPT

#include <a_samp>

const DRUNK_RESET_LEVEL = 2000,
    MIN_FPS_VALUE = 1,
    MAX_FPS_VALUE = 300,
    TEXTDRAW_UPDATE_INTERVAL = 2*100;

const Float:TD_POS_X = 1.0,
    Float:TD_POS_Y = 137.0,
    Float:TD_LETTER_SIZE_X = 0.14,
    Float:TD_LETTER_SIZE_Y = 0.8,
    Float:TD_TEXT_SIZE_X = 23.0,
    Float:TD_TEXT_SIZE_Y = -311.0,
    TD_COLOR = 0xB4B5B7FF;

static TFF_FPS_UpdateTimer[MAX_PLAYERS],
    PlayerText:TFF_FPS_Textdraw[MAX_PLAYERS];

stock GetPlayerFPS(playerid) {
    new Current_DrunkLevel = GetPlayerDrunkLevel(playerid);
    
    SetPVarInt(playerid, "Prev_DrunkLevel", GetPVarInt(playerid, "Current_DrunkLevel_II"));
    SetPVarInt(playerid, "Current_DrunkLevel_II", Current_DrunkLevel);
    
    if(Current_DrunkLevel <= 100) {
        SetPlayerDrunkLevel(playerid, DRUNK_RESET_LEVEL);

        return GetPVarInt(playerid, "Last_FPS");
    }
    
    new FPS_Value = GetPVarInt(playerid, "Prev_DrunkLevel") - Current_DrunkLevel;
    
    if(MIN_FPS_VALUE <= FPS_Value <= MAX_FPS_VALUE) {
        SetPVarInt(playerid, "Last_FPS", FPS_Value);

        return FPS_Value;
    }
    
    return GetPVarInt(playerid, "Last_FPS");
}

forward FPS_Text_Update(playerid);
public FPS_Text_Update(playerid) {
    new Textdraw_String[16];
    format(Textdraw_String, sizeof(Textdraw_String), "FPS: %d", GetPlayerFPS(playerid));
    PlayerTextDrawSetString(playerid, TFF_FPS_Textdraw[playerid], Textdraw_String);

    return true;
}

stock CreatePlayer_FPS_Text(playerid) {
    TFF_FPS_Textdraw[playerid] = CreatePlayerTextDraw(playerid, TD_POS_X, TD_POS_Y, "FPS: 0");
    
    PlayerTextDrawFont(playerid, TFF_FPS_Textdraw[playerid], 1);
    PlayerTextDrawLetterSize(playerid, TFF_FPS_Textdraw[playerid], TD_LETTER_SIZE_X, TD_LETTER_SIZE_Y);
    PlayerTextDrawColor(playerid, TFF_FPS_Textdraw[playerid], TD_COLOR);
    PlayerTextDrawBackgroundColor(playerid, TFF_FPS_Textdraw[playerid], 255);
    PlayerTextDrawSetOutline(playerid, TFF_FPS_Textdraw[playerid], 0);
    PlayerTextDrawSetProportional(playerid, TFF_FPS_Textdraw[playerid], 1);
    PlayerTextDrawSetShadow(playerid, TFF_FPS_Textdraw[playerid], 1);
    PlayerTextDrawUseBox(playerid, TFF_FPS_Textdraw[playerid], 1);
    PlayerTextDrawBoxColor(playerid, TFF_FPS_Textdraw[playerid], 255);
    PlayerTextDrawTextSize(playerid, TFF_FPS_Textdraw[playerid], TD_TEXT_SIZE_X, TD_TEXT_SIZE_Y);
    PlayerTextDrawSetSelectable(playerid, TFF_FPS_Textdraw[playerid], 0);
    
    PlayerTextDrawShow(playerid, TFF_FPS_Textdraw[playerid]);

    return true;
}

public OnFilterScriptInit() {
    print(" ");
    print("__________________________________________________________________");
    print("||==============================================================||");
    print("||                                                              ||");
    print("||                    Anti-Ping Filterscript                    ||");
    print("||                                                              ||");
    print("|| Developer: Calasans                                          ||");
    print("|| Instagram: ocalasans                                         ||");
    print("|| Discord: ocalasans                                           ||");
    print("||                                                              ||");
    print("||==============================================================||");
    print("__________________________________________________________________");
    print(" ");

    return true;
}

public OnPlayerConnect(playerid) {
    CreatePlayer_FPS_Text(playerid);
    TFF_FPS_UpdateTimer[playerid] = SetTimerEx("FPS_Text_Update", TEXTDRAW_UPDATE_INTERVAL, true, "i", playerid);

    return true;
}

public OnPlayerDisconnect(playerid, reason) {
    KillTimer(TFF_FPS_UpdateTimer[playerid]);
    PlayerTextDrawHide(playerid, TFF_FPS_Textdraw[playerid]);
    
    DeletePVar(playerid, "Prev_DrunkLevel");
    DeletePVar(playerid, "Current_DrunkLevel_II");
    DeletePVar(playerid, "Last_FPS");

    return true;
}