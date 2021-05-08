//Init extensions
DerpXml_Init();
DerpXmlRead_OpenFile("saveData.xml")
while DerpXmlRead_Read() 
{
	show_debug_message(DerpXmlRead_CurType()+", "+DerpXmlRead_CurValue())
	if (DerpXmlRead_CurType() == DerpXmlType_OpenTag)
	{
		switch DerpXmlRead_CurValue()
		{
			case "save":
			    show_debug_message("slot number max = "+DerpXmlRead_CurGetAttribute("slotNumber"));
			    break;
			case "slot":
			    show_debug_message("slot = "+DerpXmlRead_CurGetAttribute("id"));
			    break;
			case "form":
				show_debug_message("form name = "+DerpXmlRead_CurGetAttribute("name"));
				break;
			case "stage":
			case "skill":
			{
				show_debug_message("id = "+DerpXmlRead_CurGetAttribute("id"));
				show_debug_message("name = "+DerpXmlRead_CurGetAttribute("name"));
				break;
			}
		}
	}
	else if (DerpXmlRead_CurType() == DerpXmlType_Text)
	{
		show_debug_message("value = "+DerpXmlRead_CurValue());
	}
}
DerpXmlRead_CloseFile();


//Init game
room_goto(roomStart);

fncStaticInitGame();