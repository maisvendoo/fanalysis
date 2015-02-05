//-------------------------------------------------------------------
//
//		Loading forces data from file
//		(c) maisvendoo, 2015/02/05
//
//-------------------------------------------------------------------
module	LoadData;

import	std.stdio;
import	std.file;
import	std.string;
import	std.conv;

//-------------------------------------------------------------------
//
//-------------------------------------------------------------------
double[][] load_forces_data(string log_name)
{
	double[][] data;

	if (!exists(log_name))
		return null;

	File log = File(log_name, "r");

	// Detect number of lines
	int lines_count = 0;

	while (!log.eof())
	{
		string line = log.readln();
		lines_count++;
	}

	log.close();

	// Create data buffer
	data = new double[][](lines_count-1);

	// Read double data from file
	log = File(log_name, "r");

	for (int i = 0; i < data.length; i++)
	{
		string line = log.readln();

		double	tmp = 0;
		char	c = ' ';
		string	str = "";

		for (int j = 0; j < line.length; j++)
		{
			if (line[j] != ' ')
			{
				str ~= line[j];
			}
			else
			{
				if (str != "")
				{
					data[i] ~= to!double(str);
					str = "";
				}
			}
		}	
	}

	log.close();

	return data;
}