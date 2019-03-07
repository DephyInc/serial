#include "revision.h"
#include "git_rev_data.h"

char SERIAL_LIB_DATE[] = { "BUILD_DATE: " __DATE__ " " __TIME__};
char SERIAL_LIB_GIT_INFO[] = { "GIT_REVISION: " GIT_REV_DATA };
