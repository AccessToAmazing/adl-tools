//============================================================================
// Name        : EiffelBridgeNativeClient.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

//#include <iostream>
//#include "OpenEHRManager.h"
//
//
//using namespace std;
//
//int main() {
//	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
//
//	OpenEHRManager* manager = NULL;
//	if(manager == NULL)
//			 manager = new OpenEHRManager();
//	return 0;
//}
#include "OpenEHRManager.h"
#include "eif_setup.h"  /* Macros EIF_INITIALIZE and EIF_DISPOSE_ALL */
#include "eif_eiffel.h" /* Exported functions of the Eiffel run-time */


int main (int argc, char **argv, char **envp)
{
	OpenEHRManager* manager = new OpenEHRManager();
	string errorDir = string("c:\\tmp\\error_db");
	manager->setErrorDBDirPath(errorDir);
	string schemaDir = string("c:\\tmp\\rm_schemas");
	manager->setRmSchemaDirPath(schemaDir);
	vector<string>* names = manager->getArchetyepNames();
	string name = names->at(2);
	cout << name;
	string& arcNameToCompile = name;
	manager->compileArchetype(arcNameToCompile);
//	delete(manager);
	cout << "completed";
	return 0;
}


//EIF_PROCEDURE ep;
//	EIF_OBJECT obj;
//	EIF_TYPE_ID tid;
//
//	EIF_INITIALIZE(failure)
//
//	eif_enable_visible_exception();
//
//	tid = eif_type_id ("EXPERIMENTAL_APPLICATION");
//	if (tid == EIF_NO_TYPE)
//		eif_panic ("No type id.");
//	obj = eif_create (tid);
//
//	ep = eif_procedure("perform_parsing", tid);
//	(ep)(eif_access(obj));
//
//
//	EIF_DISPOSE_ALL
//
//	return 0;


