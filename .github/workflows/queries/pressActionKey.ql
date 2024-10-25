/**
 * @description Find test functions that call the function "pressActionKey".
 * @kind problem
 * @id javascript/pressActionKey
 * @problem.severity recommendation
 */

import javascript

predicate isTestFunction(Function f) {
  exists(string name |
    name = f.getName() and 
    (name.matches("%test%") or f.getFile().getBaseName().matches("%test%"))
  )
}

predicate callsPressActionKey(Function f) {
  exists(CallExpr call |
    call.getCallee().toString() = "pressActionKey" and
    call = f.getAChild()
  )
}

from Function testFunction
where isTestFunction(testFunction) 
    and callsPressActionKey(testFunction)
select testFunction, "This test function calls 'pressActionKey'."
