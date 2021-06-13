/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
DerpXml_Init();

saveSlotNumber = 6;
fileSavePath = "saveData.xml";
fileConfigPath = "configData.xml";
fileSaveDataList = array_create(saveSlotNumber, noone);

SaveSlotData = function(_slotId) constructor
{
	slotId				= _slotId;
	active       		= false;
	lastTimeSave		=
	{
		day    : 0,
		month  : 0,
		year   : 0,
		hour   : 0,
		minute : 0,
	};
			
	totalTime			= 0;
	enemiesDestroyed	= 0;
			
	lifeUp				= 0;
	weaponUp			= 0;
			
	modelUnlock 		=
	{
		modelZX:
		{
			isActived		: 1,
			skillActived	:
			{
				skill_0		: 0,
				skill_1		: 0
			}
		},
		modelX:
		{
			isActived		: 0,
			skillActived	:
			{
				skill_0		: 0,
				skill_1		: 0
			}
		},
		modelH:
		{
			isActived		: 1,
			skillActived	:
			{
				skill_0		: 0,
				skill_1		: 0
			}
		},
		modelP:
		{
			isActived		: 0,
			skillActived	:
			{
				skill_0		: 0,
				skill_1		: 0
			}
		},
		modelL:
		{
			isActived		: 1,
			skillActived	:
			{
				skill_0		: 0,
				skill_1		: 0
			}
		},
		modelF:
		{
			isActived		: 0,
			skillActived	:
			{
				skill_0		: 0,
				skill_1		: 0
			}
		}
	};
			
	stageScore =
	{
		stage_0:
		{
			stageName : "Air Craft",
			highestScore : 0
		},
		stage_1:
		{
			stageName : "Ruined Power Plant",
			highestScore : 0
		},
		stage_2:
		{
			stageName : "Volcano",
			highestScore : 0
		},
		stage_3:
		{
			stageName : "Forest",
			highestScore : 0
		},
		stage_4:
		{
			stageName : "Ice Lake",
			highestScore : 0
		},
		stage_5:
		{
			stageName : "Evil Base",
			highestScore : 0
		}
	};
}

currentPlayerData = noone;

//Read sub variables
currentSlot = 0;
currentTag = noone;
currentType = noone;
currentForm = noone;
currentStage = 0;
currentSkill = 0;

playSlot = 0;

function fncCreateTempGameData()
{
	for (var i = 0; i < array_length(fileSaveDataList); i++)
	{
		var currentSlot = new SaveSlotData(i);
		fileSaveDataList[i] = currentSlot;
	}
}

function fncResetGameSlot(slotId)
{
	var saveDataSlot = new SaveSlotData(slotId);
	fileSaveDataList[slotId] = saveDataSlot;
}

function fncInitGameData()
{
	if (DerpXmlRead_OpenFile(fileSavePath))
	{
		return;
	}
	else
	{
		fncSaveGameData();
	}
}

function fncLoadGameData()
{
	DerpXmlRead_OpenFile(fileSavePath);
	
	while DerpXmlRead_Read() 
	{
		switch DerpXmlRead_CurType() 
		{
			case DerpXmlType_OpenTag:
			{
				currentTag = DerpXmlRead_CurValue();
				switch (currentTag)
				{
					case "slot":
					{
						currentSlot = real(DerpXmlRead_CurGetAttribute("id"));
						fileSaveDataList[currentSlot].slotId = currentSlot;
						fileSaveDataList[currentSlot].active = real(DerpXmlRead_CurGetAttribute("active"));
					}	break;
					case "form":
					{
						currentForm = DerpXmlRead_CurGetAttribute("name");
						switch (currentForm)
						{
							case "ZX":
							{
								fileSaveDataList[currentSlot].modelUnlock.modelZX.isActived = real(DerpXmlRead_CurGetAttribute("active"));
							}	break;
							case "X":
							{
								fileSaveDataList[currentSlot].modelUnlock.modelX.isActived = real(DerpXmlRead_CurGetAttribute("active"));
							}	break;
							case "H":
							{
								fileSaveDataList[currentSlot].modelUnlock.modelH.isActived = real(DerpXmlRead_CurGetAttribute("active"));
							}	break;
							case "P":
							{
								fileSaveDataList[currentSlot].modelUnlock.modelP.isActived = real(DerpXmlRead_CurGetAttribute("active"));
							}	break;
							case "L":
							{
								fileSaveDataList[currentSlot].modelUnlock.modelL.isActived = real(DerpXmlRead_CurGetAttribute("active"));
							}	break;
							case "F":
							{
								fileSaveDataList[currentSlot].modelUnlock.modelF.isActived = real(DerpXmlRead_CurGetAttribute("active"));
							}	break;
						}
					}	break;
					case "skill":
					{
						currentSkill = real(DerpXmlRead_CurGetAttribute("id"));
					}	break;
					case "stage":
					{
						currentStage = real(DerpXmlRead_CurGetAttribute("id"));	
					}
				}
			}	break;
			
			case DerpXmlType_Text:
			{
				switch (currentTag)
				{
					case "totalTime":
					{
						fileSaveDataList[currentSlot].totalTime = real(DerpXmlRead_CurValue());
					}	break;
					case "hour":
					{
						fileSaveDataList[currentSlot].lastTimeSave.hour = real(DerpXmlRead_CurValue());
					}	break;
					case "minute":
					{
						fileSaveDataList[currentSlot].lastTimeSave.minute = real(DerpXmlRead_CurValue());
					}	break;
					case "day":
					{
						fileSaveDataList[currentSlot].lastTimeSave.day = real(DerpXmlRead_CurValue());
					}	break;
					case "month":
					{
						fileSaveDataList[currentSlot].lastTimeSave.month = real(DerpXmlRead_CurValue());
					}	break;
					case "year":
					{
						fileSaveDataList[currentSlot].lastTimeSave.year = real(DerpXmlRead_CurValue());
					}	break;
					case "enemiesDestroyed":
					{
						fileSaveDataList[currentSlot].enemiesDestroyed = real(DerpXmlRead_CurValue());
					}	break;
					case "lifeUp":
					{
						fileSaveDataList[currentSlot].lifeUp = real(DerpXmlRead_CurValue());
					}	break;
					case "weaponUp":
					{
						fileSaveDataList[currentSlot].weaponUp = real(DerpXmlRead_CurValue());
					}	break;
					case "skill":
					{
						switch (currentForm)
						{
							case "ZX":
							{
								if (currentSkill == 0)
									fileSaveDataList[currentSlot].modelUnlock.modelZX.skillActived.skill_0 = real(DerpXmlRead_CurValue());
								else
									fileSaveDataList[currentSlot].modelUnlock.modelZX.skillActived.skill_1 = real(DerpXmlRead_CurValue());
							}	break;
							
							case "X":
							{
								if (currentSkill == 0)
									fileSaveDataList[currentSlot].modelUnlock.modelX.skillActived.skill_0 = real(DerpXmlRead_CurValue());
								else
									fileSaveDataList[currentSlot].modelUnlock.modelX.skillActived.skill_1 = real(DerpXmlRead_CurValue());
							}	break;
							
							case "H":
							{
								if (currentSkill == 0)
									fileSaveDataList[currentSlot].modelUnlock.modelH.skillActived.skill_0 = real(DerpXmlRead_CurValue());
								else
									fileSaveDataList[currentSlot].modelUnlock.modelH.skillActived.skill_1 = real(DerpXmlRead_CurValue());
							}	break;
							
							case "P":
							{
								if (currentSkill == 0)
									fileSaveDataList[currentSlot].modelUnlock.modelP.skillActived.skill_0 = real(DerpXmlRead_CurValue());
								else
									fileSaveDataList[currentSlot].modelUnlock.modelP.skillActived.skill_1 = real(DerpXmlRead_CurValue());
							}	break;
							
							case "L":
							{
								if (currentSkill == 0)
									fileSaveDataList[currentSlot].modelUnlock.modelL.skillActived.skill_0 = real(DerpXmlRead_CurValue());
								else
									fileSaveDataList[currentSlot].modelUnlock.modelL.skillActived.skill_1 = real(DerpXmlRead_CurValue());
							}	break;
							
							case "F":
							{
								if (currentSkill == 0)
									fileSaveDataList[currentSlot].modelUnlock.modelF.skillActived.skill_0 = real(DerpXmlRead_CurValue());
								else
									fileSaveDataList[currentSlot].modelUnlock.modelF.skillActived.skill_1 = real(DerpXmlRead_CurValue());
							}	break;
						}
					}	break;
					case "stage":
					{
						switch (currentStage)
						{
							case 0:
								fileSaveDataList[currentSlot].stageScore.stage_0.highestScore = real(DerpXmlRead_CurValue());
								break;
							case 1:
								fileSaveDataList[currentSlot].stageScore.stage_1.highestScore = real(DerpXmlRead_CurValue());
								break;
							case 2:
								fileSaveDataList[currentSlot].stageScore.stage_2.highestScore = real(DerpXmlRead_CurValue());
								break;
							case 3:
								fileSaveDataList[currentSlot].stageScore.stage_3.highestScore = real(DerpXmlRead_CurValue());
								break;
							case 4:
								fileSaveDataList[currentSlot].stageScore.stage_4.highestScore = real(DerpXmlRead_CurValue());
								break;
							case 5:
								fileSaveDataList[currentSlot].stageScore.stage_5.highestScore = real(DerpXmlRead_CurValue());
								break;
						}
					}
				}
			}	break;
		}
	}
	DerpXmlRead_CloseFile();
}

function fncSaveGameData()
{
	DerpXmlWrite_New();
	
	DerpXmlWrite_OpenTag("save");
	DerpXmlWrite_Attribute("slotNumber", string(saveSlotNumber));
	for (var i = 0; i < saveSlotNumber; i++)
	{
		DerpXmlWrite_OpenTag("slot");
		DerpXmlWrite_Attribute("id", string(fileSaveDataList[i].slotId));
		DerpXmlWrite_Attribute("active", string(fileSaveDataList[i].active));
		
			DerpXmlWrite_OpenTag("totalTime");
			DerpXmlWrite_Text(string(fileSaveDataList[i].totalTime));
			DerpXmlWrite_CloseTag();
		
			DerpXmlWrite_OpenTag("saveTime");
		
				DerpXmlWrite_OpenTag("hour");
				DerpXmlWrite_Text(string(fileSaveDataList[i].lastTimeSave.hour));
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("minute");
				DerpXmlWrite_Text(string(fileSaveDataList[i].lastTimeSave.minute));
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("day");
				DerpXmlWrite_Text(string(fileSaveDataList[i].lastTimeSave.day));
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("month");
				DerpXmlWrite_Text(string(fileSaveDataList[i].lastTimeSave.month));
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("year");
				DerpXmlWrite_Text(string(fileSaveDataList[i].lastTimeSave.year));
				DerpXmlWrite_CloseTag();
			
			DerpXmlWrite_CloseTag();
		
			DerpXmlWrite_OpenTag("enemiesDestroyed");
			DerpXmlWrite_Text(string(fileSaveDataList[i].enemiesDestroyed));
			DerpXmlWrite_CloseTag();
		
			DerpXmlWrite_OpenTag("lifeUp");
			DerpXmlWrite_Text(string(fileSaveDataList[i].lifeUp));
			DerpXmlWrite_CloseTag();
		
			DerpXmlWrite_OpenTag("weaponUp");
			DerpXmlWrite_Text(string(fileSaveDataList[i].weaponUp));
			DerpXmlWrite_CloseTag();
		
			DerpXmlWrite_OpenTag("modelUnlock");
		
				DerpXmlWrite_OpenTag("form");
				DerpXmlWrite_Attribute("name", "ZX");
				DerpXmlWrite_Attribute("active", string(fileSaveDataList[i].modelUnlock.modelZX.isActived));
			
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(0));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelZX.skillActived.skill_0));
					DerpXmlWrite_CloseTag();
				
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(1));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelZX.skillActived.skill_1));
					DerpXmlWrite_CloseTag();
				
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("form");
				DerpXmlWrite_Attribute("name", "X");
				DerpXmlWrite_Attribute("active", string(fileSaveDataList[i].modelUnlock.modelX.isActived));
			
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(0));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelX.skillActived.skill_0));
					DerpXmlWrite_CloseTag();
				
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(1));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelX.skillActived.skill_1));
					DerpXmlWrite_CloseTag();
				
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("form");
				DerpXmlWrite_Attribute("name", "H");
				DerpXmlWrite_Attribute("active", string(fileSaveDataList[i].modelUnlock.modelH.isActived));
			
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(0));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelH.skillActived.skill_0));
					DerpXmlWrite_CloseTag();
				
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(1));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelH.skillActived.skill_1));
					DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("form");
				DerpXmlWrite_Attribute("name", "P");
				DerpXmlWrite_Attribute("active", string(fileSaveDataList[i].modelUnlock.modelP.isActived));
			
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(0));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelP.skillActived.skill_0));
					DerpXmlWrite_CloseTag();
				
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(1));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelP.skillActived.skill_1));
					DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("form");
				DerpXmlWrite_Attribute("name", "L");
				DerpXmlWrite_Attribute("active", string(fileSaveDataList[i].modelUnlock.modelL.isActived));
			
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(0));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelL.skillActived.skill_0));
					DerpXmlWrite_CloseTag();
				
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(1));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelL.skillActived.skill_1));
					DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_OpenTag("form");
				DerpXmlWrite_Attribute("name", "F");
				DerpXmlWrite_Attribute("active", string(fileSaveDataList[i].modelUnlock.modelF.isActived));
			
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(0));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelF.skillActived.skill_0));
					DerpXmlWrite_CloseTag();
				
					DerpXmlWrite_OpenTag("skill");
					DerpXmlWrite_Attribute("id", string(1));
						DerpXmlWrite_Text(string(fileSaveDataList[i].modelUnlock.modelF.skillActived.skill_1));
					DerpXmlWrite_CloseTag();
			
				DerpXmlWrite_CloseTag();
			
			DerpXmlWrite_CloseTag();
			
			DerpXmlWrite_OpenTag("stageScore");
			
				DerpXmlWrite_OpenTag("stage");
				DerpXmlWrite_Attribute("id", 0);
				DerpXmlWrite_Attribute("name", string(fileSaveDataList[i].stageScore.stage_0.stageName));
				
					DerpXmlWrite_Text(string(fileSaveDataList[i].stageScore.stage_0.highestScore));
					
				DerpXmlWrite_CloseTag();
				
				DerpXmlWrite_OpenTag("stage");
				DerpXmlWrite_Attribute("id", 1);
				DerpXmlWrite_Attribute("name", string(fileSaveDataList[i].stageScore.stage_1.stageName));
				
					DerpXmlWrite_Text(string(fileSaveDataList[i].stageScore.stage_1.highestScore));
					
				DerpXmlWrite_CloseTag();
				
				DerpXmlWrite_OpenTag("stage");
				DerpXmlWrite_Attribute("id", 2);
				DerpXmlWrite_Attribute("name", string(fileSaveDataList[i].stageScore.stage_2.stageName));
				
					DerpXmlWrite_Text(string(fileSaveDataList[i].stageScore.stage_2.highestScore));
					
				DerpXmlWrite_CloseTag();
				
				DerpXmlWrite_OpenTag("stage");
				DerpXmlWrite_Attribute("id", 3);
				DerpXmlWrite_Attribute("name", string(fileSaveDataList[i].stageScore.stage_3.stageName));
				
					DerpXmlWrite_Text(string(fileSaveDataList[i].stageScore.stage_3.highestScore));
					
				DerpXmlWrite_CloseTag();
				
				DerpXmlWrite_OpenTag("stage");
				DerpXmlWrite_Attribute("id", 4);
				DerpXmlWrite_Attribute("name", string(fileSaveDataList[i].stageScore.stage_4.stageName));
				
					DerpXmlWrite_Text(string(fileSaveDataList[i].stageScore.stage_4.highestScore));
					
				DerpXmlWrite_CloseTag();
				
				DerpXmlWrite_OpenTag("stage");
				DerpXmlWrite_Attribute("id", 5);
				DerpXmlWrite_Attribute("name", string(fileSaveDataList[i].stageScore.stage_5.stageName));
				
					DerpXmlWrite_Text(string(fileSaveDataList[i].stageScore.stage_5.highestScore));
					
				DerpXmlWrite_CloseTag();
			
			DerpXmlWrite_CloseTag();
		
		DerpXmlWrite_CloseTag();
		
	}
	DerpXmlWrite_CloseTag();
	
	var xmlString = DerpXmlWrite_GetString();
	DerpXmlWrite_UnloadString();
	
	show_debug_message(xmlString);
	var f = file_text_open_write(fileSavePath);
	file_text_write_string(f, xmlString);
	file_text_close(f);
}

function fncLoadGameDataSlot(slotId)
{
	currentPlayerData = fileSaveDataList[slotId];
}

function fncSaveGameDataSlot(slotId)
{
	fileSaveDataList[slotId] = currentPlayerData;
}

function fncInitConfigData()
{
	if (DerpXmlRead_OpenFile(fileConfigPath))
	{
		return;
	}
	else
	{
		
	}
}

function fncLoadConfigData()
{
	
}

function fncSaveConfigData()
{
	
}

fncCreateTempGameData();
fncInitGameData();
fncInitConfigData();
fncLoadGameData();
fncLoadGameDataSlot(playSlot);