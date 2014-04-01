##' Create list element from object and give it the name of the object
##' as element name
##'
##' Instead of mylist$mysomething <- mysomething, we can now write
##' mylist %byname% mysomething. A little easier.
##' @param structure a list object to append to
##' @param x an object to append to the the list object
##' @return nothing, invoked for side effects: the original list is
##' modified in place
##' @export 
`%byname%` <- function(structure, x) {
  x_quoted <- deparse(substitute(x))
  x_name <- as.name(x_quoted)
  str_name <- as.name(deparse(substitute(structure)))
  eval(
    substitute(
      STR[[QUOTED]] <<- NAME,
      list(STR = str_name, QUOTED = x_quoted, NAME = x_name)))
}

##' Create list element from objects in supplied list and give them
##' the names of the objects as element names
##' 
##' Instead of mylist$mysomething <- mysomething; mylist$somethingelse
##' <- somethingelse, we can now write mylist %byname%
##' list(mysomething, somethingelse). A little easier.
##' @param structure a list object to append to
##' @param x a list holding the objects to be added to the list
##' @return nothing, invoked for side effects: the original list is
##' modified in place
##' @export 
`%rbyname%` <- function(structure, x) {
  call <- match.call()
  members_list <- call[[3]]
  n_members <- length(members_list)
  for (i in 2:n_members) {
    x_name <- members_list[[i]]
    x_quoted <- as.character(x_name)
    str_name <- as.name(deparse(substitute(structure)))
    eval(
      substitute(
        STR[[QUOTED]] <<- NAME,
        list(STR = str_name, QUOTED = x_quoted, NAME = x_name)))
  }
}
