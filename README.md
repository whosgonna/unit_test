# OVERVIEW



The function of this repository is to give a quick overview of the concept
of unit testing by providing a simple module that contains two nearly 
identical methods:  `rand1thru10` and `badrand1thru10`.  Both of these methods
are supposed to generate a random integer between 1 and 10, however  there is
a flaw in the `badrand1thru10` method.

# Random Number Generation in Perl:

A (perhaps too descriptive) explaination of how to generate a random integer 
between 1 and 10 in Perl using the `rand()` and `int()` functions.

    rand(EXPR)

The `rand()` function in perl "Returns a random fractional number greater than 
or equal to 0 and less than the value of EXPR."  Within the module we are using 
`rand(10)` which generates a random number between 0 and 9.99999999999999 (number 
of digits can vary based on system, but it will always be *less than* 10.

    int(EXPR)

The `int()` function returns the integer portion of EXPR.  This essentially 
truncates to the integer.  Thus, we have the following in the module:

    int(rand(10))

This will now return a random integer between 0 and 9.  To get a random integer
between 1 and 10, simply add 1.  Thus the correct expression should be:

    int(rand(10)) + 1

## Perl Modules

A perl module is like a library in that it can import methods (functions / 
subroutines, etc).  For complex programs this provides useful segementation of 
code.  The sample module here called myRand is overly simplistic, and does not 
have much real-world use.  It contains two methods that can be used in another
Perl script:  `rand1thru10` which will correctly generate a random number 
between 1 and 10, using the process described above, and a method 
`badrand1thru10` which does not add a 1 to the result of `int(rand(10)` which 
will then geenrate a random number between 0 and 9.  This is done to create 
a test which will intentionally fail.

## Test Files

By convention, perl test files are in a directory named 't', and end in a '.t' 
file name.  This repository contains one test file, which runs two tests.  Real
world examples would have more tests, even for basic things like "did the 
module load corretly".  The first test is 1000 iterations of the `rand1thru10` 
method.  If any of the results are less than 1 or more than 10, a 1 is returned
immediately, and no further iterations are run.  If 1000 iterations are 
completed then a 0 is returned.  The test itself simply checks to see if 0 is 
returned.  If so, then the test passes, if anything other than 0 is returned, 
the test is a failure.  For `rand1thru10` this test is expected to pass.

The second test is identical to the first, except that instead of calling 
`rand1thru10`, the method `badrand1thru10` is used.  At somepoint within the 
1000 iterations of the test, `badrand1thru10` should result in a 0 (because 
we know it actually generate a random integer between 0 and 9).  This value is
less than 1, so a 1 is returned, and the test fails.

The test files can be run using the `prove` command.  Since these 
tests use the myRand.pm module, which is not installed, we also need to 
indicate to `prove` where to find the modules.  Again (by convention) the 
modules are packaged into the `lib` directory, and `prove` has a `-l` switch 
that is a short cut to say "look for modules in the ./lib directory".  Also, 
`prove` has a `-v` switch, which can be used to provide more verbose ouput. 
Thus, prove should be run from the root of this repository as `prove -lv`.  The
result should look like this:
```
 C:\Users\benka\Documents\GitHub\unit_test> prove -lv
 t\010_random.t ..
 ok 1 - Run 1000 iterations and check for out of range.
 
 #   Failed test 'Run 1000 iterations and check for out of range. (expected to fail as an example)'
 not ok 2 - Run 1000 iterations and check for out of range. (expected to fail as an example)#   at t\010_random.t line 19.
 
 #          got: '1'
 #     expected: '0'
 1..2
 # Looks like you failed 1 test of 2.
 Dubious, test returned 1 (wstat 256, 0x100)
 Failed 1/2 subtests
 
 Test Summary Report
 -------------------
 t\010_random.t (Wstat: 256 Tests: 2 Failed: 1)
   Failed test:  2
   Non-zero exit status: 1
 Files=1, Tests=2,  1 wallclock secs ( 0.11 usr +  0.01 sys =  0.12 CPU)
 Result: FAIL
```
 

# SUMMARY

Summary
