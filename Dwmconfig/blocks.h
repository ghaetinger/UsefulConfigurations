//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/* {"", "cat /tmp/recordingicon 2>/dev/null",	0,	9}, */
	/* {"",	"music",	0,	11},*/
	/* {"",	"pacpackages",	0,	8}, */
	/* {"",	"news",		0,	6}, */
	/* {"",	"crypto",	0,	13}, */
	/* {"",	"price bat \"Basic Attention Token\" 🦁",	0,	20}, */
	/* {"",	"price btc Bitcoin 💰",				0,	21}, */
	/* {"",	"price lbc \"LBRY Token\" 📚",			0,	22}, */
	/* {"",	"torrent",	20,	7}, */
	/* {"",	"cpu",		10,	18}, */
	{"",	"disk",	10,	14},
	{"",	"memory",	5,	14},
	{"",	"mailbox",	180,	12},
	{"",	"nettraf",	1,	16},
	{"",	"volume",	0,	10},
	{"",	"battery",	5,	3},
	{"",	"clock",	60,	1},
	{"",	"internet",	5,	4},
	/* {"",	"help-icon",	0,	15}, */
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
