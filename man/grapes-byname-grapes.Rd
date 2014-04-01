\name{\%byname\%}
\alias{\%byname\%}
\title{Create list element from object and give it the name of the object
as element name}
\usage{
structure \%byname\% x
}
\arguments{
  \item{structure}{a list object to append to}

  \item{x}{an object to append to the the list object}
}
\value{
nothing, invoked for side effects: the original list is
modified in place
}
\description{
Instead of mylist$mysomething <- mysomething, we can now
write mylist %byname% mysomething. A little easier.
}

