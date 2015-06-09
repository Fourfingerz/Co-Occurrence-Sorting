Co-Occurrences
==============

This algorithm sifts through a history of searches and finds terms that have a high probability of relatedness with the other.

Example: If the output produces "Levi Strauss & Co,JNCO Jean Company" or "Jay-Z,Beyonce", these pairs are less likely to be coincidental and are probably related due to them co-occuring times above N. This is an early working prototype and has not been completely refactored.


Usage
-----------------------

This Ruby program is runnable from a command line, that reads from standard input and prints to standard output. It can also take in a .txt file in the format specified below. For example, on Unix-based systems it should be runnable like this:

    ruby your_program.rb < input_file > output_file

Input Format
------------

The first line contains an integer, N, the minimum number of co-occurrences for a company pair to appear in the output. Subsequent lines are comma-separated lists of company names, the user view log. (company names will never contain a comma, so you don't have to worry about parsing "real" CSV.)

Example Input
------------

    2
    Administaff Inc,Bed Bath & Beyond Inc,Graybar Electric Company Inc
    Levi Strauss & Co,Lockheed Martin Corporation,Manor Care Inc
    Bed Bath & Beyond Inc,Graybar Electric Company Inc,National Fuel Gas Company
    Levi Strauss & Co,Manor Care Inc,Nvidia Corp,Northwest Airlines Corp,Office Depot Inc,Graybar Electric Company Inc,Office Depot Inc
    Administaff Inc,Nvidia Corp,Office Depot Inc
    Graybar Electric Company Inc,National Fuel Gas Company,Office Depot Inc
    Graybar Electric Company Inc,Pennzoil-Quaker State Company,Peoples Energy Corp,Graybar Electric Company Inc,Office Depot Inc
    Nvidia Corp,Office Depot Inc,Pennzoil-Quaker State Company
    Bed Bath & Beyond Inc,Graybar Electric Company Inc,Office Depot Inc


Example Output
-------------

    Bed Bath & Beyond Inc,Graybar Electric Company Inc
    Graybar Electric Company Inc,Office Depot Inc
    Nvidia Corp,Office Depot Inc

Example Explanation
-------------------

Since the first line of the input reads, 3, the output must only show those companies which appear together in a at least 2 user view log rows. There are exactly 3 pairs of companies that appear together at least 2 times in the user view log input:

1. Bed Bath & Beyond Inc,Graybar Electric Company Inc appear three times.
2. Graybar Electric Company Inc,Office Depot Inc appear three times.
3. Nvidia Corp,Office Depot Inc appear two times.


Also note that each company pair is listed in ascending dictionary order with the company that it appears with. As well as all company pairs are listed in ascending dictionary order with the other pairs that meet the minimum number of co-occurrences.

Who wrote this?
---------------

My name is Sze Chan and I wrote this in February, 2015 as my foray into sorting algorithms. I consider this my first release into the open source realm and hope it will help another developer out there!

How can I help?
---------------

Co-Occurrences is open source and suggestions to refactor (particularly rewriting that nested loop to improve performance on larger data sets) the code are encouraged and welcome!



