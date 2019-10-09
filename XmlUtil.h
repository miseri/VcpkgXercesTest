#pragma once

namespace xmlutil {

/// This function must be called at the beginning of the program!!!
/// It takes care of module initialisation
bool initialise();
/// This function must be called at the end of the program!!!
/// It takes care of module cleanup
void terminate();

} // xmlutil

