/**
 * @description Finds functions that are more than 10 lines long.
 * @kind problem
 * @id javascript/long-functions
 * @problem.severity recommendation
 */

import javascript

predicate isJavaScriptOrTypeScriptFile(File file) {
  file.getExtension() = "js" or file.getExtension() = "ts" or file.getExtension() = "tsx"
}

predicate isLongMethod(Function f) {
  f.getNumLines() > 10
}

from Function f, File file
where f.getFile() = file and isJavaScriptOrTypeScriptFile(file) 
    and isLongMethod(f)
select f, "This function has more than 10 lines, which may be considered long."
